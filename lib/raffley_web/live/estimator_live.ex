defmodule RaffleyWeb.EstimatorLive do
  use RaffleyWeb, :live_view

  def mount(_params, _session, socket) do
    if connected?(socket) do
      Process.send_after(self(), :tick, 2000)
    end

    {:ok,
     socket
     |> assign(tickets: 0, price: 3, page_title: "Estimator")}
  end

  def handle_event("add", %{"quantity" => quantity}, socket) do
    quantity = String.to_integer(quantity)
    # current_ticket_count = socket.assigns.tickets
    # new_ticket_count = current_ticket_count + quantity
    # socket = assign(socket, tickets: new_ticket_count)

    # Explanation: behind the scenes, this is exactly what update/3 does

    {:noreply,
     socket
     |> update(:tickets, &(&1 + quantity))}
  end

  def handle_event("set-price", %{"price" => price}, socket) do
    price = String.to_integer(price)
    {:noreply, socket |> assign(price: price)}
  end

  # Messages sent by Elixir processes
  def handle_info(:tick, socket) do
    # Schedule the next tick
    Process.send_after(self(), :tick, 2000)

    {:noreply, socket |> update(:tickets, &(&1 + 10))}
  end
end
