defmodule DynamicCmd.MixProject do
  use Mix.Project

  def project do
    [
      app: :dynamic_cmd,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {DynamicCmd, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:elixir_uuid, "~> 1.2"},
      {:jason, "~> 1.1"},

      # Commanded
      {:commanded, "~> 1.1"},
      {:commanded_eventstore_adapter, "~> 1.1"},
      {:commanded_ecto_projections, "~> 1.1"},
      {:eventstore, "~> 1.1"}
    ]
  end
end
