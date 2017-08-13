defmodule BittrexAPI do
  use HTTPoison.Base
  alias BittrexAPI.Client

  @type response :: nil | {integer, any} | Poison.Parser.t

  @spec process_response(atom, HTTPoison.Response.t) :: response
  def process_response(:ok, %HTTPoison.Response{status_code: 200, body: ""}), do: nil
  def process_response(:ok, %HTTPoison.Response{status_code: 200, body: body}), do: Poison.decode!(body)
  def process_response(:ok, %HTTPoison.Response{status_code: status_code, body: ""}), do: { status_code, nil }
  def process_response(:ok, %HTTPoison.Response{status_code: status_code, body: body }), do: { status_code, Poison.decode!(body) }

  @spec get(binary, Client.t) :: %{}
  def get(url, _client = %Client {url: base_url}) do
    base_url <> url
    |> get
    |> (&process_response(:ok, &1)).()
  end

end
