defmodule Mihari do
  use Application

  @supervisor Mihari.Supervisor

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(@supervisor, [])
    ]

    opts = [strategy: :one_for_one]
    Supervisor.start_link(children, opts)
  end
end
