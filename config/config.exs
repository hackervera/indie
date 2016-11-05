# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :indie,
  ecto_repos: [Indie.Repo]

# Configures the endpoint
config :indie, Indie.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ouMGCVrVe0sxLf8U7FbJfRkpdRnlvL7CY6G54GKYtuYazXqM3OFAaYgD5yPYjBR3",
  render_errors: [view: Indie.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Indie.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:module, :function, :line, :request_id],
  level: :debug


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
