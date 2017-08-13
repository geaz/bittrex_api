defmodule BittrexAPI.Market do
    import BittrexAPI
    alias BittrexAPI.Client

    @spec buy_limit(binary, float, float, Client.t) :: BittrexAPI.response
    def buy_limit(market, quantity, rate, client) do 
        getp "market/buylimit?market=#{market}&quantity=#{quantity}&rate=#{rate}", client
    end

    @spec sell_limit(binary, float, float, Client.t) :: BittrexAPI.response
    def sell_limit(market, quantity, rate, client) do 
        getp "market/selllimit?market=#{market}&quantity=#{quantity}&rate=#{rate}", client
    end

    @spec cancel(binary, Client.t) :: BittrexAPI.response
    def cancel(uuid, client) do 
        getp "market/cancel?uuid=#{uuid}", client
    end

    @spec get_open_orders(Client.t) :: BittrexAPI.response
    def get_open_orders(client) do
        getp "market/getopenorders?", client
    end

    @spec get_open_orders(binary, Client.t) :: BittrexAPI.response
    def get_open_orders(market, client) do
        getp "market/getopenorders?market=#{market}", client
    end
end