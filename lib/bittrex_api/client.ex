defmodule BittrexAPI.Client do
    @enforce_keys [:api_key, :api_secret]
    defstruct api_key: nil, api_secret: nil, url: "https://bittrex.com/api/v1.1/"

    @type t :: %__MODULE__{ api_key: binary, api_secret: binary, url: binary }
end