defmodule DynamicCmd.CMD do
  use Commanded.Application, otp_app: :dynamic_cmd
  router(DynamicCmd.Router)

  def init(config) do
    name = Keyword.fetch!(config, :name)

    # Set dynamic event store name
    config = put_in(config, [:event_store, :name], Module.concat([name, EventStore]))

    {:ok, config}
  end
end
