defmodule DynamicCmd.Listeners.Task do
  use GenServer

  alias DynamicCmd.{CMD, DynamicCMD}
  alias DynamicCmd.Commands.DispatchCommand

  defstruct [:id]

  def start_link(id, opts) do
    name = {:via, Registry, {DynamicCmd.Listeners.Registry, id}}
    GenServer.start_link(__MODULE__, {id, opts}, name: name)
  end

  def child_spec([id, _] = args) do
    %{id: id, restart: :transient, start: {__MODULE__, :start_link, args}}
  end

  @impl true
  def init({id, _opts}) do
    state = %__MODULE__{
      id: id
    }

    {:ok, state, {:continue, :new_cmd_app}}
  end

  @impl true
  def handle_continue(:new_cmd_app, state) do
    DynamicCMD.start(String.to_atom(state.id))

    for _ <- 1..100 do
      %DispatchCommand{id: state.id}
      |> CMD.dispatch(consistency: :strong, application: String.to_atom(state.id))

      :timer.sleep(1000)
    end

    {:stop, :normal, state}
  end
end
