defmodule MihariTest do
  use ExUnit.Case
  doctest Mihari
  @moduletag :capture_log

  setup do
    Application.stop(:mihari)
    :ok = Application.start(:mihari)
  end

  test "Starts a watcher" do
    assert {:ok, mihari} = Mihari.start([])
  end
end
