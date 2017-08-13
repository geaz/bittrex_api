defmodule BittrexAPI.Public do
    import BittrexAPI
    alias BittrexAPI.Client

    @spec get_markets(Client.t) :: %{}
    def get_markets(client) do
        get "public/getmarkets", client
    end

end