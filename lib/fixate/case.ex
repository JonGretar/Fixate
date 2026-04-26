defmodule Fixate.Case do
  @moduledoc false

  use ExUnit.CaseTemplate

  using do
    quote do
      ExUnit.Case.register_attribute(__MODULE__, :fixture, accumulate: true)
    end
  end

  setup context do
    fixtures =
      context.registered.fixture
      |> List.flatten()
      |> Enum.map(&load_fixture/1)

    {:ok, fixtures}
  end

  defp load_fixture({key, fixture_path}) do
    {_key, extension} = build_key_and_extension(fixture_path)
    {key, read_and_parse(extension, fixture_path)}
  end

  defp load_fixture(fixture_path) do
    {key, extension} = build_key_and_extension(fixture_path)
    {key, read_and_parse(extension, fixture_path)}
  end

  defp read_and_parse(extension, fixture_path) do
    filepath = Path.join(Fixate.fixture_path(), fixture_path)
    case Fixate.cache_get(filepath) do
      {:ok, result} ->
        result
      :error ->
        data = case File.read(filepath) do
          {:ok, contents} -> contents
          {:error, _} -> raise Fixate.FixtureNotFoundError, filepath
        end
        result = Fixate.parse(extension, data)
        Fixate.cache_put(filepath, result)
        result
    end
  end

  defp build_key_and_extension(path) do
    [basename, extension] = Path.basename(path) |> String.split(".", parts: 2)
    {String.to_atom(Path.basename(basename, "." <> extension)), extension}
  end
end
