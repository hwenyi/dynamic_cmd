defmodule Mix.Tasks.MultiApp do
  use Mix.Task

  @impl Mix.Task
  def run([ids]) do
    {:ok, _} = Application.ensure_all_started(:dynamic_cmd)

    id_list = String.split(ids, ",")

    id_list
    |> Enum.with_index()
    |> Task.async_stream(
      fn {id, index} ->
        # wait 10 secs to start the next one to avoid having prepare calls at the same time
        :timer.sleep(:timer.seconds(10) * index)

        Mix.shell().info("starting a new commanded application #{id}")

        {:ok, pid} = DynamicCmd.Listeners.Task.start_link(UUID.uuid4(), [])
        ref = Process.monitor(pid)

        receive do
          {:DOWN, ^ref, :process, _, _reason} ->
            Mix.shell().info("closing a new commanded application #{id}")
            :ok
        end
      end,
      timeout: :infinity
    )
    |> Enum.map(fn {:ok, response} -> response end)
  end
end
