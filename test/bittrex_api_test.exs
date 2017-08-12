defmodule BittrexAPITest do
  use ExUnit.Case
  doctest BittrexAPI

  test "greets the world" do
    assert BittrexAPI.hello() == :world
  end
end
