defmodule DynamicCmd.Events.CommandDispatched do
  @derive Jason.Encoder
  defstruct [:id, :version]
end
