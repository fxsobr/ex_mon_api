defmodule ExMonApiWeb.TrainerPokemonsController do
  use ExMonApiWeb, :controller

  action_fallback ExMonApiWeb.FallbackController

  def create(conn, params) do
    params
    |> ExMonApi.create_trainer_pokemon()
    |> handle_response(conn, "create_pokemon.json", :created)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> ExMonApi.delete_trainer_pokemon()
    |> handle_delete(conn)
  end

  def show(conn, %{"id" => id}) do
    id
    |> ExMonApi.fetch_trainer_pokemon()
    |> handle_response(conn, "show_pokemon.json", :ok)
  end

  def update(conn, params) do
    params
    |> ExMonApi.update_trainer_pokemon()
    |> handle_response(conn, "update_pokemon.json", :ok)
  end

  defp handle_delete({:ok, _pokemon}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _reason} = error, _conn), do: error

  defp handle_response({:ok, pokemon}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, pokemon: pokemon)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
