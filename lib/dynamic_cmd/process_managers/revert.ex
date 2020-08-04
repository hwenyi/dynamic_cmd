defmodule DynamicCmd.ProcessManagers.Revert do
  @derive Jason.Encoder

  use Commanded.ProcessManagers.ProcessManager,
    application: DynamicCmd.CMD,
    name: "RevertProcessManager",
    consistency: :strong

  alias DynamicCmd.Events.CommandDispatched
  alias DynamicCmd.Commands.RevertCommand

  defstruct [:id, version: 0]

  def interested?(%CommandDispatched{id: id}), do: {:continue, id}
  def interested?(_), do: false

  def handle(_state, %CommandDispatched{} = event) do
    %RevertCommand{id: event.id}
  end

  def apply(state, %CommandDispatched{} = event) do
    %{state | id: event.id, version: state.version}
  end
end
