# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :chatterize,
  ecto_repos: [Chatterize.Repo]

# Configures the endpoint
config :chatterize, Chatterize.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EbxX8qHRfVWuX75ZL3xhqDgCUn2lZXYzaEHo+ZVkZ9r/N4Gr0M6PqkoQ+9Ccg2jQ",
  render_errors: [view: Chatterize.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Chatterize.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
