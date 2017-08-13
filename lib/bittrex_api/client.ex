defmodule BittrexAPI.Client do
    @moduledoc """
    This module provides the Bittrex client. The client is necessary for all API methods.

    ## Examples

        iex> client = %BittrexAPI.Client{api_key: "KEY", api_secret: "SECRET"}
        %BittrexAPI.Client{api_key: "KEY", api_secret: "SECRET", url: "https://bittrex.com/api/v1.1/"}

    """
    
    @enforce_keys [:api_key, :api_secret]
    defstruct api_key: nil, api_secret: nil, url: "https://bittrex.com/api/v1.1/"

    @type t :: %__MODULE__{ api_key: binary, api_secret: binary, url: binary }
end