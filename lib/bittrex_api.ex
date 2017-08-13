defmodule BittrexAPI do
  use HTTPoison.Base
  alias BittrexAPI.Client

  @type response :: nil | {integer, any} | Poison.Parser.t

  @spec process_response(HTTPoison.Response.t) :: response
  def process_response(_resp = {:ok, %HTTPoison.Response{status_code: 200, body: body}}), do: {:ok, Poison.decode!(body)}
  def process_response(_resp = {:ok, resp}), do: {:ok, resp}
  def process_response(resp), do: resp

  @spec get(binary, Client.t) :: %{}
  def get(url, _client = %Client{url: base_url}) do
    base_url <> url
    |> get
    |> process_response
  end

  def getp(url, client = %Client{api_key: api_key, url: base_url}) do
    timestamp = DateTime.utc_now
    |> DateTime.to_unix

    call_url = base_url 
    <> url 
    <> "&apikey=#{api_key}&nonce=" 
    <> Integer.to_string timestamp
    
    hmac = call_url
    |> hash_url(client)

    call_url
    |> HTTPoison.get(["apisign": hmac])
    |> process_response
  end

  defp hash_url(url, _client = %Client{api_secret: api_secret}) do
    :crypto.hmac(:sha512, api_secret, url)
    |> Base.encode16
  end

end
