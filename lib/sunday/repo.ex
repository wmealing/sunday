defmodule Sunday.Repo do
  use Ecto.Repo,
    otp_app: :sunday,
    adapter: Ecto.Adapters.Postgres
end
