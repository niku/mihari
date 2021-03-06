defmodule Mihari.Mixfile do
  use Mix.Project

  def project do
    [app: :mihari,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     description: description,
     package: package]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger],
     mod: {Mihari, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:earmark, "~> 0.1", only: :dev},
     {:ex_doc, "~> 0.11", only: :dev},
     {:dialyxir, "~> 0.3", only: [:dev]}]
  end

  defp description, do: "A generic watcher"

  defp package do
    [maintainers: ["niku"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/niku/mihari"}]
  end
end
