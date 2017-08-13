defmodule BittrexAPITest.Market do
    use ExUnit.Case, async: false
    use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
    import BittrexAPI.Market

    doctest BittrexAPI.Market

    @client %BittrexAPI.Client{api_key: "Key", api_secret: "Secret"}
     
    setup_all do
        HTTPoison.start
    end

    test "buy_limit/4" do
        use_cassette "market#buylimit" do
            {:ok, %{"result" => order}} = buy_limit "BTC-LTC", 1000.0, 0.00000226, @client
            assert "68eea770-93fa-4879-9886-decf98cfae17" === Map.get order, "uuid"
        end
    end

    test "sell_limit/4" do
        use_cassette "market#selllimit" do
            {:ok, %{"result" => order}} = sell_limit "BTC-NEO", 10.0, 1.0, @client
            assert "21172d66-ade6-465f-870e-2df4970f64b2" === Map.get order, "uuid"
        end
    end

    test "cancel/2" do
        use_cassette "market#cancel" do
            {:ok, result} = cancel "21172d66-ade6-465f-870e-2df4970f64b2", @client
            assert true === Map.get result, "success"
        end
    end

    test "get_open_orders/1" do
        use_cassette "market#openorders" do
            {:ok, %{"result" => result}} = get_open_orders @client
            first_order = Enum.at result, 0
            assert "3869afee-ca61-4b52-9fd4-c62a3440c02c" === Map.get first_order, "OrderUuid"
        end
    end
end