defmodule ExMonApi.PokeApi.ClientTest do
  @moduledoc false
  use ExUnit.Case
  import Tesla.Mock

  alias ExMonApi.PokeApi.Client

  @base_url "https://pokeapi.co/api/v2/pokemon/"

  describe "get_pokemon/1" do
    test "when there is a pokemon with the given name, returns the pokemon" do
      body = %{"name" => "charmander", "weight" => 60, "types" => ["eletric"]}

      mock(fn %{method: :get, url: @base_url <> "charmander"} ->
        %Tesla.Env{status: 200, body: body}
      end)

      respose = Client.get_pokemon("charmander")
      expected_response = {:ok, %{"name" => "charmander", "types" => ["eletric"], "weight" => 60}}

      assert respose == expected_response
    end

    test "when there is no pokemon with the given name, returns the error" do
      mock(fn %{method: :get, url: @base_url <> "hello"} ->
        %Tesla.Env{status: 404}
      end)

      respose = Client.get_pokemon("hello")
      expected_response = {:error, "Pokemon not found!"}

      assert respose == expected_response
    end

    test "when there is an unexpected error, returns the error" do
      mock(fn %{method: :get, url: @base_url <> "charmander"} ->
        {:error, :timeout}
      end)

      respose = Client.get_pokemon("charmander")
      expected_response = {:error, :timeout}

      assert respose == expected_response
    end
  end
end
