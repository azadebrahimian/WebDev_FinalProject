defmodule CookingAppWeb.Helpers do

    api_key = "88a684f43c204ecea33e2e0b904f7565"

    # show recipe by id
    def getRecipeById(id) do
        url = "https://api.spoonacular.com/recipes/716429/information?apiKey=#{api_key}&includeNutrition=true"
        resp = HTTPoison.get!(url)
        if resp.status_code == 200 do
            data = Jason.decode!(resp.body)
            result = %{
                id: data["id"],
                title: data["title"],
                image: data["image"],
                sourceUrl: data["sourceUrl"],
            }
            {:ok, result}
        else
            result = %{}
            {:error, result}
        end
        
    end

    # converts a list to a comma separated string array
    def arrToString(arr, accum) do
        if arr == [] do
            String.slice(accum, 0..-2)
        else 
            arrToString((tl arr), accum <> "," <> (hd arr))
        end
    end
    
    # show receipe by an array of owned-ingredients
    def getRecipeByIngredients(ing) do
        ing_string = arrToString(ing, "")
        url = "https://api.spoonacular.com/recipes/findByIngredients?apiKey=#{api_key}&ingredients=#{ing_string}"
        resp = HTTPoison.get!(url)
        if resp.status_code == 200 do
            data = Jason.decode!(resp.body)
            result = %{
                id: data["id"],
                title: data["title"],
                image: data["image"],
                missedIngredients: data["missedIngredients"],
                usedIngredients: data["usedIngredients"],
                unusedIngredients: data["unusedIngredients"]
            }
            {:ok, result}
        else
            result = %{}
            {:error, result}
        end
    end

    # show a single ingredient by name ~~~
    def getIngredientByName(name) do
        url = "https://api.spoonacular.com/food/ingredients/search?apiKey=#{api_key}&query=#{name}"
        resp = HTTPoison.get!(url)
        if resp.status_code == 200 do
            data = Jason.decode!(resp.body)
            result = %{
                results = data["results"]
            }
            {:ok, result}
        else
            result = %{}
            {:error, result}
        end return {:ok, result}
    end 
    # show a single ingredient by id
end