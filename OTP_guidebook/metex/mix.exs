defmodule Metex.Mixfile do
  use Mix.Project

  def project do
    [app: :metex,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :httpoison]]
  end

  defp deps do
    [
      {:httpoison, "~> 0.9.0"},
      {:json,      "~> 0.3.0"}
    ]
  end
end
