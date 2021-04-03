defmodule CookingAppWeb.ApiController do
    use CookingAppWeb, :controller

    action_fallback CookingAppWeb.FallbackController

    def show(conn, _params) do

    end


    

end 