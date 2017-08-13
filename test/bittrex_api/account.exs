defmodule BittrexAPITest.Account do
    use ExUnit.Case, async: false
    use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
    import BittrexAPI.Account

    doctest BittrexAPI.Account

    @client %BittrexAPI.Client{api_key: "Key", api_secret: "Secret"}
     
    setup_all do
        HTTPoison.start
    end

    test "get_balances/1" do
        use_cassette "account#balances" do
            {:ok, %{"result" => balances}} = get_balances @client
            first_balance = Enum.at balances, 0
            assert "BTC" === Map.get first_balance, "Currency"
        end
    end

    test "get_balance/2" do
        use_cassette "account#balance" do
            {:ok, %{"result" => balance}} = get_balance "BTC", @client
            assert "BTC" === Map.get balance, "Currency"
        end
    end

    test "get_deposit_address/2" do
        use_cassette "account#depositaddress" do
            {:ok, %{"result" => address}} = get_deposit_address "ETH", @client
            assert "ETH" === Map.get address, "Currency"
        end
    end

    test "withdraw/4" do
        use_cassette "account#withdraw" do
            {:ok, %{"result" => withdrawal}} = withdraw "ETH", 1.0, "XXX", @client
            assert "68eea770-93fa-4879-9886-decf98cfae17" === Map.get withdrawal, "uuid"
        end
    end

    test "get_order/2" do
        use_cassette "account#order" do
            {:ok, %{"result" => order}} = get_order "68eea770-93fa-4879-9886-decf98cfae17", @client
            assert "68eea770-93fa-4879-9886-decf98cfae17" === Map.get order, "OrderUuid"
        end
    end

    test "get_order_history/1" do
        use_cassette "account#orderhistory" do
            {:ok, %{"result" => order_history}} = get_order_history @client
            first_order = Enum.at order_history, 0
            assert "edb8cbab-2eb4-4f14-acab-1bfbaf09c366" === Map.get first_order, "OrderUuid"
        end
    end

    test "get_withdrawal_history/1" do
        use_cassette "account#withdrawalhistory" do
            {:ok, %{"result" => withdrawal_history}} = get_withdrawal_history @client
            first_withdrawal = Enum.at withdrawal_history, 0
            assert "BTC" === Map.get first_withdrawal, "Currency"
        end
    end

    test "get_deposit_history/1" do
        use_cassette "account#deposithistory" do
            {:ok, %{"result" => deposit_history}} = get_deposit_history @client
            first_deposit = Enum.at deposit_history, 0
            assert "BTC" === Map.get first_deposit, "Currency"
        end
    end
end