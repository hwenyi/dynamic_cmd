use Mix.Config

config :dynamic_cmd, DynamicCmd.EventStore,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "version_control_eventstore_test",
  hostname: "localhost",
  pool_size: 10,
  pool_overflow: 5

config :logger, level: :info
