defmodule Raffley.Raffles do
  alias Raffley.Raffles.Raffle

  def list do
    [
      %Raffle{
        id: 1,
        prize: "Autographed Jersey",
        ticket_price: 2,
        status: :open,
        image_path: "/images/jersey.jpg",
        description: "Step up sports fans!"
      },
      %Raffle{
        id: 2,
        prize: "Coffe With a Yeti",
        ticket_price: 3,
        status: :upcoming,
        image_path: "/images/yeti-coffee.jpg",
        description: "A super-chill coffee date."
      },
      %Raffle{
        id: 3,
        prize: "A Yeti Cooler",
        ticket_price: 1,
        status: :closed,
        image_path: "/images/comic-book.jpg",
        description: "A rare collectible!"
      }
    ]
  end

  def get_one!(id) when is_integer(id) do
    list()
    |> Enum.find(&(&1.id == id))
  end

  def get_one!(id) when is_binary(id) do
    id
    |> String.to_integer()
    |> get_one!()
  end

  def get_featured(raffle) do
    list()
    |> Enum.filter(&(&1.id != raffle.id))
  end
end
