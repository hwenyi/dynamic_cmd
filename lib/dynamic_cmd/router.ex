defmodule DynamicCmd.Router do
  use Commanded.Commands.Router

  alias DynamicCmd.Commands.{DispatchCommand, RevertCommand}
  alias DynamicCmd.Aggregates.VersionControl

  dispatch([DispatchCommand, RevertCommand], to: VersionControl, identity: :id)
end
