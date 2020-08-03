use Mix.Config

config :dynamic_cmd, DynamicCmd.EventStore,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "version_control_eventstore_dev",
  hostname: "localhost",
  pool_size: 10

config :logger, level: :info
