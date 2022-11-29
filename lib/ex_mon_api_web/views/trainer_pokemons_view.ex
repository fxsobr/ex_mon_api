defmodule ExMonApiWeb.TrainerPokemonsView do
  @moduledoc false
  alias ExMonApi.Trainer.Pokemon
  use ExMonApiWeb, :view

  def render("create_pokemon.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          inserted_at: inserted_at,
          nickname: nickname,
          types: types,
          trainer_id: trainer_id,
          weight: weight
        }
      }) do
    %{
      message: "Pokemon created",
      pokemon: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        nickname: nickname,
        types: types,
        trainer_id: trainer_id,
        weight: weight
      }
    }
  end

  def render("show_pokemon.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          inserted_at: inserted_at,
          nickname: nickname,
          types: types,
          trainer_id: trainer_id,
          trainer: %{id: trainer_id, name: trainer_name},
          weight: weight
        }
      }) do
    %{
      id: id,
      name: name,
      inserted_at: inserted_at,
      nickname: nickname,
      types: types,
      trainer: %{trainer_id: trainer_id, name: trainer_name},
      weight: weight
    }
  end

  def render("update_pokemon.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          inserted_at: inserted_at,
          nickname: nickname,
          types: types,
          trainer_id: trainer_id,
          weight: weight
        }
      }) do
    %{
      message: "Pokemon updated",
      pokemon: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        nickname: nickname,
        types: types,
        trainer_id: trainer_id,
        weight: weight
      }
    }
  end
end
