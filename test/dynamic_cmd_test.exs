defmodule DynamicCmdTest do
  use ExUnit.Case
  doctest DynamicCmd

  test "greets the world" do
    assert DynamicCmd.hello() == :world
  end
end
