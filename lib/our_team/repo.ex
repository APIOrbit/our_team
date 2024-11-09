defmodule OurTeam.Repo do
  use Ecto.Repo,
    otp_app: :our_team,
    adapter: Ecto.Adapters.Postgres
end
