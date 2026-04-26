defmodule Fixate.FixtureNotFoundError do
  defexception [:message]

  @impl true
  def exception(path) do
    %__MODULE__{
      message:
        "fixture file not found: #{path}\n  Make sure the file exists relative to your project root."
    }
  end
end
