defmodule DynamicCmd.Aggregates.VersionControl do
  alias DynamicCmd.Commands.{DispatchCommand, RevertCommand}
  alias DynamicCmd.Events.{CommandDispatched, CommandReverted}

  defstruct [:id, version: 0]

  def execute(state, %DispatchCommand{} = command) do
    %CommandDispatched{id: command.id, version: state.version + 1}
  end

  def execute(state, %RevertCommand{} = command) do
    %CommandReverted{id: command.id, version: state.version - 1}
  end

  def apply(state, %event_type{} = event)
      when event_type in [CommandDispatched, CommandReverted] do
    %{state | id: event.id, version: event.version}
  end
end
