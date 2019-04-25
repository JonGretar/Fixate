defmodule Fixate.Case do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Geo.Turf
      # import Geo.Turf.FixturesCase
      ExUnit.Case.register_attribute __MODULE__, :fixture, accumulate: true
    end
  end

  setup context do
    fixtures = context.registered.fixture
    |> List.flatten
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
    filepath = Path.join([Mix.Project.app_path(), "priv/fixtures", fixture_path])
    Fixate.parse(extension, File.read!(filepath))
  end

  defp build_key_and_extension(path) do
    [basename, extension] = Path.basename(path) |> String.split(".", parts: 2)
    {String.to_atom(Path.basename(basename, "."<>extension)), extension}
  end

  def parse("txt", filename) do
    fixture_path = Path.join([Mix.Project.app_path(), "priv/fixtures", filename])
    File.read!(fixture_path)
  end

  def parse("integer.txt", filename) do
    parse("txt", filename) |> String.to_integer
  end



end
