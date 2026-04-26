defmodule Fixate.MixProject do
  use Mix.Project

  def project do
    [
      app: :fixate,
      version: "0.2.0",
      description: description(),
      package: package(),
      elixir: "~> 1.14",
      licenses: ["MIT"],
      docs: docs(),
      deps: deps(),
      dialyzer: [
        plt_file: {:no_warn, "priv/plts/#{Mix.env()}.plt"},
        plt_add_apps: [:ex_unit, :mix]
      ],
      preferred_cli_env: [precommit: :test],
      aliases: aliases()
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
    [
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Jón Grétar Borgþórsson"],
      licenses: ["MIT"],
      source_url: "https://github.com/JonGretar/Fixate",
      links: %{"GitHub" => "https://github.com/JonGretar/Fixate"}
    ]
  end

  def docs do
    [
      main: "Fixate"
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.20", only: :dev},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false}
    ]
  end

  defp aliases do
    [
      precommit: [
        "compile --warnings-as-errors",
        "format --check-formatted",
        "test",
        "dialyzer",
        "credo --strict"
      ]
    ]
  end
end
