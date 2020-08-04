defmodule DynamicCmd.DynamicCMD do
  def start(uuid) do
    children = [
      {DynamicCmd.CMD, name: uuid},
      {DynamicCmd.ProcessManagers.Revert, application: uuid}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
