# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Configures the endpoint
config :go_api, GoApiWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: GoApiWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: GoApi.PubSub,
  live_view: [signing_salt: "T4y+5odR"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Setting UP url & APIKEY
config :go_api, GoApi,
  cg_base_url: "https://api.goapi.id/v1/",
  api_key: "YOUR_API_KEY",
  print_url: false



# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
