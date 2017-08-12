defmodule BittrexAPI do
  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      {BittrexAPI.Client, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BittrexAPI.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
