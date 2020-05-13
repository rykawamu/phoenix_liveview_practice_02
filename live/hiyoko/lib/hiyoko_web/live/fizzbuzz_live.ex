defmodule HiyokoWeb.FizzbuzzLive do
  use Phoenix.LiveView

  import Calendar.Strftime

  def mount(_params, _session, socket ) do
    if connected?(socket) do
      Process.send_after(self(), :tick, 1000)
      Process.send_after(self(), :fizzbuzz, 3000)
    end
    { :ok, assign( socket, time: local_time(), num: 0, val: "initial" ) }
  end

  def handle_info(:tick, socket) do
    Process.send_after(self(), :tick, 1000)
    {:noreply, assign(socket, time: local_time())}
  end

  def handle_info(:fizzbuzz, socket) do
    Process.send_after(self(), :fizzbuzz, 3000)
    next_num = socket.assigns.num + 1
    {num, val} = fizzbuzz(next_num)
    {:noreply, assign( socket, num: num, val: val ) }
  end

  ##### local

  defp local_time() do
    :calendar.local_time() |> strftime!("%r")
  end

  defp calc_fb({n, 0, 0}), do: {n, "FizzBuzz"}
  defp calc_fb({n, 0, _}), do: {n, "Fizz"}
  defp calc_fb({n, _, 0}), do: {n, "Buzz"}
  defp calc_fb({n, _, _}), do: {n, to_string(n)}

  defp fizzbuzz(n) do
    cond do
      n < 1 -> {n , "Cannot calculate"}
      true  -> calc_fb({n, rem(n,3), rem(n, 5)})
    end
  end
end
