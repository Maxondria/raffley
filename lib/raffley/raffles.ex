defmodule Raffley.Raffles do
  alias Raffley.Raffles.Raffle
  alias Raffley.Repo

  def list do
    Repo.all(Raffle)
  end

  def get_one!(id) do
    Repo.get!(Raffle, id)
  end

  def get_featured(raffle) do
    list()
    |> Enum.filter(&(&1.id != raffle.id))
  end
end
