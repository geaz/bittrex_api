defmodule BittrexAPITest.Public do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import BittrexAPI.Public

  doctest BittrexAPI.Public

  @client %BittrexAPI.Client{api_key: "key", api_secret: "secret"}

  setup_all do
    HTTPoison.start
  end

  test "get_markets/1" do
    use_cassette "public#markets" do
        {:ok, %{"result" => result}} = get_markets @client
        first_market = Enum.at result, 0
        assert "BTC" === Map.get first_market, "BaseCurrency"
    end
  end

  test "get_currencies/1" do
    use_cassette "public#currencies" do
        {:ok, %{"result" => result}} = get_currencies @client
        first_currency = Enum.at result, 0
        assert "BTC" === Map.get first_currency, "Currency"
    end
  end

  test "get_ticker/1" do
    use_cassette "public#ticker" do
        {:ok, %{"result" => result}} = get_ticker "BTC-LTC", @client
        assert 0.011361 === Map.get result, "Ask"
    end
  end

  test "get_market_summaries/1" do
    use_cassette "public#summaries" do
        {:ok, %{"result" => result}} = get_market_summaries @client
        first_market = Enum.at result, 0
        assert "BITCNY-BTC" === Map.get first_market, "MarketName"
    end
  end

  test "get_market_summary/2" do
    use_cassette "public#summary" do
        {:ok, %{"result" => result}} = get_market_summary "BTC-LTC", @client
        market_summary = Enum.at result, 0
        assert "BTC-LTC" === Map.get market_summary, "MarketName"
    end
  end

  test "get_order_book(:sell)/3" do
    use_cassette "public#sellbook" do
        {:ok, %{"result" => result}} = get_order_book :sell, "BTC-LTC", @client
        first_order = Enum.at result, 0
        assert 9.34882432 === Map.get first_order, "Quantity"
    end
  end

  test "get_order_book(:buy)/3" do
    use_cassette "public#buybook" do
        {:ok, %{"result" => result}} = get_order_book :buy, "BTC-LTC", @client
        first_order = Enum.at result, 0
        assert 31.82259201 === Map.get first_order, "Quantity"
    end
  end

  test "get_order_book(:both)/3" do
    use_cassette "public#bothbook" do
        {:ok, %{"result" => %{"buy" => buy, "sell" => sell}}} = get_order_book :both, "BTC-LTC", @client
        first_buy = Enum.at buy, 0
        first_sell = Enum.at sell, 0

        assert 31.82259201 === Map.get first_buy, "Quantity"
        assert 9.34882432 === Map.get first_sell, "Quantity"
    end
  end

  test "get_market_history/2" do
    use_cassette "public#history" do
        {:ok, %{"result" => result}} = get_market_history "BTC-LTC", @client
        first_trade = Enum.at result, 0
        assert 0.011361 === Map.get first_trade, "Price"
    end
  end

end
