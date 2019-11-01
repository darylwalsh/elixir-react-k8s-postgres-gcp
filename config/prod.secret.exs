# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
use Mix.Config

default_secret_key_base = :crypto.strong_rand_bytes(43) |> Base.encode64
#database_url =
#  System.get_env("DATABASE_URL") ||
 #   raise """
 #   environment variable DATABASE_URL is missing.
 #   For example: ecto://USER:PASS@HOST/DATABASE
 #   """

config :hooroosh, Hooroosh.Repo,
  # ssl: true,
    username: System.get_env("POSTGRES_USER") || "postgres",
    password: System.get_env("POSTGRES_PASSWORD") || "postgres",
    database: System.get_env("POSTGRES_DB") || "hooroosh_prod",
    socket_dir:  System.get_env("POSTGRES_SOCKET_DIR"),
    pool_size: 15
 # url: database_url,
 # pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

secret_key_base =
  System.get_env("SECRET_KEY_BASE") || default_secret_key_base
   
  #environment variable SECRET_KEY_BASE is missing.
   # You can generate one by calling: mix phx.gen.secret
   # """

config :hooroosh, HoorooshWeb.Endpoint,
  http: [:inet6, port: String.to_integer(System.get_env("PORT") || "4000")],
  secret_key_base: secret_key_base

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
#     config :hooroosh, HoorooshWeb.Endpoint, server: true
#
# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.
