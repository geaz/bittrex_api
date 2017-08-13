defmodule BittrexAPI.Account do
    import BittrexAPI
    alias BittrexAPI.Client

    @moduledoc """
    This module exposes functionality for all account functions of the [Bittrex API](https://bittrex.com/Home/Api)
    """

    @spec get_balances(Client.t) :: BittrexAPI.response
    def get_balances(client) do
        getp "account/getbalances?", client
    end

    @spec get_balance(binary, Client.t) :: BittrexAPI.response
    def get_balance(currency, client) do
        getp "account/getbalance?currency=#{currency}", client
    end

    @spec get_deposit_address(binary, Client.t) :: BittrexAPI.response
    def get_deposit_address(currency, client) do
        getp "account/getdepositaddress?currency=#{currency}", client
    end

    @spec withdraw(binary, float, binary, Client.t, binary) :: BittrexAPI.response
    def withdraw(currency, quantity, address, client, paymentid \\ "") do
        getp "account/withdraw?currency=#{currency}&quantity=#{quantity}&address=#{address}&paymentid=#{paymentid}", client
    end

    @spec get_order(binary, Client.t) :: BittrexAPI.response
    def get_order(uuid, client) do
        getp "account/getorder?uuid=#{uuid}", client
    end

    @spec get_order_history(Client.t) :: BittrexAPI.response
    def get_order_history(client) do
        getp "account/getorderhistory?", client
    end

    @spec get_order_history(binary, Client.t) :: BittrexAPI.response
    def get_order_history(market, client) do
        getp "account/getorderhistory?market=#{market}", client
    end

    @spec get_withdrawal_history(Client.t) :: BittrexAPI.response
    def get_withdrawal_history(client) do
        getp "account/getwithdrawalhistory?", client
    end

    @spec get_withdrawal_history(binary, Client.t) :: BittrexAPI.response
    def get_withdrawal_history(currency, client) do
        getp "account/getwithdrawalhistory?currency=#{currency}", client
    end

    @spec get_deposit_history(Client.t) :: BittrexAPI.response
    def get_deposit_history(client) do
        getp "account/getdeposithistory?", client
    end

    @spec get_deposit_history(binary, Client.t) :: BittrexAPI.response
    def get_deposit_history(currency, client) do
        getp "account/getdeposithistory?currency=#{currency}", client
    end
end