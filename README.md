# Fixate

Insert fixtures into your ExUnit context in a clean manner.

The docs can be found at [https://hexdocs.pm/fixate](https://hexdocs.pm/fixate).

## Installation

The package can be installed by adding `fixate` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:fixate, "~> 0.1", only: test}
  ]
end
```

## Usage

Start Fixate by adding `Fixate.start()` to your `test/test_helper.exs` file.

```elixir
  ExUnit.start()
  Fixate.start()
```

Then inside your test files add `use Fixate.Case` to allow the fixture attribute.

```elixir
defmodule MyAppTest do
  use ExUnit.Case
  use Fixate.Case
...
```

Now you can load fixtures before each test using the `@fixture` attribute. The attribute takes either a `"path"` or a `key: "path"` values. If no key is provided the key will be generated using the base filename before the first dot. The files will be loaded from your `priv/fixtures` folder.

```elixir
  @fixture "text.txt"
  @fixture named_text: "text.txt"
  @fixture "subdirectory/subtext.txt"
  test "Reads basic files", ctx do
    assert "FILE_BODY" == ctx.text
    assert ctx.text == ctx.named_text
    assert "FILE_BODY_IN_SUBFOLDER" == ctx.subtext
  end
```


### Adding parsers for fixtures

By default Fixate will simply load the file as a binary. However this is unlikely to be enough for most tests. Instead of Fixate trying to support various file types we give you a simple way to define parsers for files by their "full" extensions.

To do this add parsers to your `test/test_helper.exs` using the `Fixate.add_parser/2` command.

```elixir
ExUnit.start()
Fixate.start()

# This will be used to parse all *.integer.txt files
Fixate.add_parser("integer.txt", &( String.to_integer(&1) ))

# This will be used to parse all *.json files
Fixate.add_parser("json", &( Jason.decode!(&1) ))

# This will be used to parse all *.geojson.json files
Fixate.add_parser("geojson.json", &( Jason.decode!(&1) |> Geo.JSON.decode! ))
```

And now the parsed values will appear instead of the binary data

```elixir
defmodule MyAppTest do
  use ExUnit.Case
  use Fixate.Case

  @fixture "text.txt"
  @fixture "text2.txt"
  test "reads basic files", ctx do
    assert "FILE_BODY" == ctx.text
    assert "OTHER_BODY" == ctx.text
  end

  @fixture answer: "answer_to_everything.integer.txt"
  test "has all the answers", ctx do
    assert 42 == ctx.answer
  end

  @fixture myhouse: "geo/location.geojson.json"
  test "locations", ctx do
    assert MyApp.get_home == ctx.myhouse
  end


end
```

For more complex parsers create a module, for example in `test/support`, and reference it.

```elixir
Fixate.add_parser("complex.xml", &MyFixtureParser.parse_complex/1)
```

## Examples

For an example of usage in an actual project check out [Geo.Turf](https://github.com/JonGretar/GeoTurf/tree/master/test)'s tests.