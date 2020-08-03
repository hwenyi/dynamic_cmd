defmodule DynamicCmd.Router do
  use Commanded.Commands.Router

  alias DynamicCmd.Commands.DispatchCommand
  alias DynamicCmd.Aggregates.VersionControl

  dispatch(DispatchCommand, to: VersionControl, identity: :id)
end
