defmodule CookingAppWeb.IngredientController do
  use CookingAppWeb, :controller

  alias CookingApp.Ingredients
  alias CookingApp.Ingredients.Ingredient

  action_fallback CookingAppWeb.FallbackController


  def index(conn, _params) do
    ingredients = Ingredients.list_ingredients()
    render(conn, "index.json", ingredients: ingredients)
  end

  def create(conn, %{"ingredient" => name}) do
    case getIngredientByName(name) do
      {:ok, result} -> # send back the ingredient information
      {:error, result} -> # send back a error message
    end 
    # with {:ok, %Ingredient{} = ingredient} <- Ingredients.create_ingredient(ingredient_params) do
    #   conn
    #   |> put_status(:created)
    #   |> put_resp_header("location", Routes.ingredient_path(conn, :show, ingredient))
    #   |> render("show.json", ingredient: ingredient)
    # end
  end

  def show(conn, %{"id" => id}) do
    ingredient = Ingredients.get_ingredient!(id)
    render(conn, "show.json", ingredient: ingredient)
  end
end
