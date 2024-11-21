defmodule RaffleyWeb.RaffleLive.Show do
  use RaffleyWeb, :live_view

  alias Raffley.Raffles

  import RaffleyWeb.CustomComponents

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(%{"id" => id}, _uri, socket) do
    # This function is called immediately after mount.

    # This could have been handled by the mount function, but we're doing it here
    # to show how to handle params.

    # Also, it has access to uri, which is not the case for mount.
    # Also, given that params are involved, this feels more natural.

    raffle = Raffles.get_one!(id)
    featured_raffles = Raffles.get_featured(raffle)

    {:noreply,
     socket
     |> assign(
       raffle: raffle,
       page_title: raffle.prize,
       featured_raffles: featured_raffles
     )}
  end

  attr :raffles, :list, required: true

  def featured_raffles(assigns) do
    ~H"""
    <section>
      <h4>Featured Raffles</h4>
      <ul class="raffles">
        <li :for={raffle <- @raffles}>
          <.link navigate={~p"/raffles/#{raffle}"}>
            <img src={raffle.image_path} alt={raffle.prize} />
            <%= raffle.prize %>
          </.link>
        </li>
      </ul>
    </section>
    """
  end
end
