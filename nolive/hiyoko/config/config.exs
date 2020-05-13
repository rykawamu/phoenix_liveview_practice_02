# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :hiyoko, HiyokoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5iYo6aqGK0MVQFhUg+/mD14xhnpIcpbwwC9QsoqTM6FMVFGrcIe+u4w7ZYTY1sQp",
  render_errors: [view: HiyokoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Hiyoko.PubSub,
  live_view: [signing_salt: "bxwVZ1bgCTxD0n+0cXJzTAwPN4KB/srq"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
