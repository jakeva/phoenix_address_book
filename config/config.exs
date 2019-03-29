# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :address_book,
  ecto_repos: [AddressBook.Repo]

# Configures the endpoint
config :address_book, AddressBookWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Tv5ARKZYD5p1GGF9NfnauqjKOT9L0+ZGTi7zIjwYsp0T2n5yu+Uu/1GRcmrjiu2x",
  render_errors: [view: AddressBookWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AddressBook.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
