use Mix.Config

config :dynamic_cmd, event_stores: [DynamicCmd.EventStore]

config :dynamic_cmd, DynamicCmd.CMD,
  event_store: [
    adapter: Commanded.EventStore.Adapters.EventStore,
    event_store: DynamicCmd.EventStore
  ],
  pub_sub: :local,
  registry: :local

import_config "#{Mix.env()}.exs"
