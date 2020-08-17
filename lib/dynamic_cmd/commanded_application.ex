defmodule DynamicCmd.CMD do
  use Commanded.Application, otp_app: :dynamic_cmd
  router(DynamicCmd.Router)

  def init(config) do
    name = Keyword.fetch!(config, :name)

    # Set dynamic event store name
    config = put_in(config, [:event_store, :name], Module.concat([name, EventStore]))

    # Set the dynamic event store schema
    schema_suffix = name |> Atom.to_string() |> String.replace("-", "")
    config = put_in(config, [:event_store, :prefix], "cmd" <> schema_suffix)

    {:ok, config}
  end
end
