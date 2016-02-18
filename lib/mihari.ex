defmodule Mihari do
  use Application

  @supervisor Mihari.Supervisor

  ## Client API

  @doc """
  Starts a watcher(mihari).
  """
  def start(%Mihari.Config{} = config) do
    Supervisor.start_child(@supervisor, [config])
  end

  @doc """
  Builds config
  """
  @spec build([term]) :: Mihari.Config.t
  def build(config) do
    struct(Mihari.Config, config)
    |> Map.update!(:input, fn {type, value} ->
      module = Module.concat([Mihari.Plugins.Input, Macro.camelize(Atom.to_string(type)), Config])
      struct(module, value)
    end)
    |> Map.update!(:output, fn {type, value} ->
      module = Module.concat([Mihari.Plugins.Output, Macro.camelize(Atom.to_string(type)), Config])
      struct(module, value)
    end)
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
