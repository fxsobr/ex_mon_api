defmodule ExMonApi.Trainer.Pokemon.Delete do
  @moduledoc false

  alias Ecto.UUID
  alias ExMonApi.{Repo, Trainer.Pokemon}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case fetch_pokemon(uuid) do
      nil -> {:error, "Pokemon not found!"}
      pokemon -> Repo.delete(pokemon)
    end
  end

  defp fetch_pokemon(uuid), do: Repo.get(Pokemon, uuid)
end
