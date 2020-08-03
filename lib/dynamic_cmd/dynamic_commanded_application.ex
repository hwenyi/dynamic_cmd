defmodule DynamicCmd.DynamicCMD do
  def start(uuid) do
    children = [
      {DynamicCmd.CMD, name: uuid}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
