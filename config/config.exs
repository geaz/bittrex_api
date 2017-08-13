use Mix.Config

config :bittrex_api,
    api_key: "test",
    api_secret: "haha"

config :logger,
    backends: [:console],
    compile_time_purge_level: :info