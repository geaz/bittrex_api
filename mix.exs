defmodule BittrexAPI.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bittrex_api,
      version: "0.1.0",
      elixir: "~> 1.5",
      description: "A simple API wrapper for Bittrex",
      package: package(),
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 0.12"},
      {:poison, "~> 3.1"},
      {:exvcr, "~> 0.8", only: :test},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false}
    ]
  end

  defp package do
    [ 
      maintainers: ["Gerrit Gazic"],
      licenses: ["MIT"],
      links: %{ "Github" => "https://github.com/geaz/bittrex_api" }
    ]
  end
end
