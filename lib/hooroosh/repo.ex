defmodule Hooroosh.Repo do
  use Ecto.Repo,
    otp_app: :hooroosh,
    adapter: Ecto.Adapters.Postgres
end
