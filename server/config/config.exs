# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cooking_app,
  ecto_repos: [CookingApp.Repo]

# Configures the endpoint
config :cooking_app, CookingAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "T/t4aZXg7ydeKYmfWaBx8ILnZQxoEpuNFiTNhXOl4kJBesM4tEYxi39wvXT8RvwQ",
  render_errors: [view: CookingAppWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: CookingApp.PubSub,
  live_view: [signing_salt: "Y6zCUBzV"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
