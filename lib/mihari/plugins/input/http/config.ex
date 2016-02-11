defmodule Mihari.Plugins.Input.Http.Config do
  defstruct [:uri, :interval]
  @type t :: %__MODULE__{uri: URI.t, interval: pos_integer()}
end
