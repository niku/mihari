defmodule Mihari.Config do
  defstruct [:name, :input, :output]
  @type t :: %__MODULE__{
    name: String.t,
    input: Mihari.Config.Input.t,
    output: Mihari.Config.Output.t
  }
end
