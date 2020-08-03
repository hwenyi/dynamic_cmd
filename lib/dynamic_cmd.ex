defmodule DynamicCmd do
  @moduledoc """
  Documentation for `DynamicCmd`.
  """
  use Application

  @doc false
  def start(_type, _args) do
    children = [
      DynamicCmd.Listeners.Supervisor,
      {Registry, keys: :unique, name: DynamicCmd.Listeners.Registry}
    ]

    opts = [strategy: :one_for_one, name: DynamicCmd.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
