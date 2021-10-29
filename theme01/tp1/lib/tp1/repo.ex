defmodule Tp1.Repo do
  use Ecto.Repo,
    otp_app: :tp1,
    adapter: Ecto.Adapters.Postgres
end
