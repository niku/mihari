defmodule MihariTest do
  use ExUnit.Case
  doctest Mihari
  @moduletag :capture_log

  setup do
    Application.stop(:mihari)
    :ok = Application.start(:mihari)
  end

  test "Builds watching configuration" do
    config = Mihari.build(name: "foo",
                          input: {:http, [uri: URI.parse("http://example.com"), interval: 1000]},
                          output: {:stdout, [] })
    assert config == %Mihari.Config{
      name: "foo",
      input: %Mihari.Plugins.Input.Http.Config{
        uri: URI.parse("http://example.com"),
        interval: 1000},
      output: %Mihari.Plugins.Output.Stdout.Config{}
    }
  end

  test "Starts a watcher" do
    config = %Mihari.Config{
      name: "foo",
      input: %Mihari.Plugins.Input.Http.Config{
        uri: URI.parse("http://example.com"),
        interval: 1000},
      output: %Mihari.Plugins.Output.Stdout.Config{}
    }
    assert {:ok, mihari} = Mihari.start(config)
  end
end
