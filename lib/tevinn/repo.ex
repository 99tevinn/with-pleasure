defmodule Tevinn.Repo do
  use Ecto.Repo,
    otp_app: :tevinn,
    adapter: Ecto.Adapters.Postgres
end
