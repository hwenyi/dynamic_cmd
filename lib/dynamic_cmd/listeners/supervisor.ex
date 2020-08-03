defmodule DynamicCmd.Listeners.Supervisor do
  use DynamicSupervisor

  def start_link(_ \\ %{}) do
    DynamicSupervisor.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def start(id, opts \\ []) do
    spec = {DynamicCmd.Listeners.Task, [id, opts]}

    DynamicSupervisor.start_child(__MODULE__, spec)
  end

  def lookup(id) do
    case Registry.lookup(DynamicCmd.Listeners.Registry, id) do
      [{pid, _}] -> {:ok, pid}
      _ -> :error
    end
  end

  def kill_listener(id) do
    case lookup(id) do
      {:ok, pid} ->
        DynamicSupervisor.terminate_child(__MODULE__, pid)

      :error ->
        :ok
    end
  end

  @impl true
  def init(_) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end
end
