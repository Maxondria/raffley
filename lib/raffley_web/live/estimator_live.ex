defmodule RaffleyWeb.EstimatorLive do
  use RaffleyWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(tickets: 0, price: 3)}
  end

  # def handle_event("calculate", %{"amount" => amount}, socket) do
  #   {:noreply, socket}
  # end
end
