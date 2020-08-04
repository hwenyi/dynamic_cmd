defmodule DynamicCmd.Events.CommandReverted do
  @derive Jason.Encoder
  defstruct [:id, :version]
end
