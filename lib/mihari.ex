defmodule Mihari do
  use Application

  @supervisor Mihari.Supervisor

  ## Client API

  @doc """
  Starts a watcher(mihari).
  """
  def start(args) do
    Supervisor.start_child(@supervisor, [args])
  end

  @doc """
  Builds config
  """
  @spec build([term]) :: Mihari.Config.t
  def build(config) do
    struct(Mihari.Config, config)
  end

  ## Server API

  @doc false
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(@supervisor, [])
    ]

    opts = [strategy: :one_for_one]
    Supervisor.start_link(children, opts)
  end
end
