defmodule ElixirStakeholder.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_stakeholder,
      version: "0.1.0",
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: [main_module: Stakeholder.CLI, name: "elixir-stakeholder"]
    ]
  end

  def application do
    [
      extra_applications: [:logger, :crypto]
    ]
  end

  def cli do
    [
      preferred_envs: [credo: :test]
    ]
  end

  defp deps do
    [
      {:jason, "~> 1.4"},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false}
    ]
  end
end
