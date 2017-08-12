defmodule BittrexAPI.Client do
    use GenServer

    ## Client API

    @doc """
    Starts the Bittrex API Client
    """
    def start_link(opts) do
        IO.puts "Server starting"
        GenServer.start_link(__MODULE__, :ok, opts)
    end

    def lookup(name) do
        GenServer.call(__MODULE__, {:test, name})
    end

    def handle_call({:test, name}, _from, state) do
        {:reply, name, state}
    end

    def hello() do
        IO.puts "Test"
    end
end