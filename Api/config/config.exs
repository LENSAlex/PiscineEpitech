# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tp1,
  ecto_repos: [Tp1.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :tp1, Tp1Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4AyZ3g/8zha5dtO+EEgJu41nxIUAjjFWGdBrAga8njoxziZ0SWCYVYch9nbNc3/K",
  render_errors: [view: Tp1Web.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Tp1.PubSub,
  live_view: [signing_salt: "bMkLkU/3"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
