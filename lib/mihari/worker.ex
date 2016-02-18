defmodule Mihari.Worker do
  use GenServer

  def start_link(%Mihari.Config{} = config, options \\ []) do
    GenServer.start_link(__MODULE__, config, options)
  end
end
