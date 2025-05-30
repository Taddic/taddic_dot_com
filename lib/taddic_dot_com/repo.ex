defmodule TaddicDotCom.Repo do
  use Ecto.Repo,
    otp_app: :taddic_dot_com,
    adapter: Ecto.Adapters.Postgres
end
