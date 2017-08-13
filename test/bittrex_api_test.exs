defmodule BittrexAPITest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  
  doctest BittrexAPI
end
