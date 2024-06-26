defmodule Blogapp2.Repo do
  use Ecto.Repo,
    otp_app: :blogapp2,
    adapter: Ecto.Adapters.Postgres
end
