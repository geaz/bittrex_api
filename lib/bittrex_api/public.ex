defmodule BittrexAPI.Public do
    import BittrexAPI
    alias BittrexAPI.Client

    @moduledoc """
    This module exposes functionality for all public functions of the [Bittrex API](https://bittrex.com/Home/Api)
    """

    @spec get_markets(Client.t) :: BittrexAPI.response
    def get_markets(client) do
        get "public/getmarkets", client
    end

    @spec get_currencies(Client.t) :: BittrexAPI.response
    def get_currencies(client) do
        get "public/getcurrencies", client
    end

    @spec get_ticker(binary, Client.t) :: BittrexAPI.response
    def get_ticker(market, client) do
        get "public/getticker?market=#{market}", client
    end

    @spec get_market_summaries(Client.t) :: BittrexAPI.response
    def get_market_summaries(client) do
        get "public/getmarketsummaries", client
    end

    @spec get_market_summary(binary, Client.t) :: BittrexAPI.response
    def get_market_summary(market, client) do
        get "public/getmarketsummary?market=#{market}", client
    end

    @spec get_order_book(:sell, binary, Client.t) :: BittrexAPI.response
    def get_order_book(:sell, market, client) do
        get "public/getorderbook?market=#{market}&type=sell", client
    end

    @spec get_order_book(:buy, binary, Client.t) :: BittrexAPI.response
    def get_order_book(:buy, market, client) do
        get "public/getorderbook?market=#{market}&type=buy", client
    end

    @spec get_order_book(:both, binary, Client.t) :: BittrexAPI.response
    def get_order_book(:both, market, client) do
        get "public/getorderbook?market=#{market}&type=both", client
    end

    @spec get_market_history(binary, Client.t) :: BittrexAPI.response
    def get_market_history(market, client) do
        get "public/getmarkethistory?market=#{market}", client
    end

end