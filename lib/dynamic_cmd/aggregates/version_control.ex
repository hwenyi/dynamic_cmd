defmodule DynamicCmd.Aggregates.VersionControl do
  alias DynamicCmd.Commands.DispatchCommand
  alias DynamicCmd.Events.CommandDispatched

  defstruct [:id, version: 0]

  def execute(state, %DispatchCommand{} = command) do
    %CommandDispatched{id: command.id, version: state.version + 1}
  end

  def apply(state, %CommandDispatched{} = event) do
    %{state | id: event.id, version: event.version}
  end
end
