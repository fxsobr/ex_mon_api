defmodule ExMonApi.Trainer.Pokemon.Get do
  @moduledoc false
  alias Ecto.UUID
  alias ExMonApi.{Repo, Trainer.Pokemon}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Pokemon, uuid) do
      nil -> {:error, "Pokemon not found!"}
      pokemon -> {:ok, Repo.preload(pokemon, :trainer)}
    end
  end
end
