defmodule Fixate.MixProject do
  use Mix.Project

  def project do
    [
      app: :fixate,
      version: "0.1.0",
      description: description(),
      package: package(),
      elixir: "~> 1.6",
      licenses: ["MIT"],
      docs: docs(),
      deps: [{:ex_doc, "~> 0.20", only: :dev}]
    ]
  end

  defp description do
    """
    Insert fixtures into your ExUnit context in a clean manner.
    """
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    # These are the default files included in the package
    [
      name: "Fixate",
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Jón Grétar Borgþórsson"],
      licenses: ["MIT"],
      source_url: "https://github.com/JonGretar/Fixate",
      links: %{"GitHub" => "https://github.com/JonGretar/geo_turf"}
    ]
  end

  def docs do
    [
      main: "Fixate"
    ]
  end


end
