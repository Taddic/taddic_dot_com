defmodule TaddicDotCom.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TaddicDotComWeb.Telemetry,
      TaddicDotCom.Repo,
      {DNSCluster, query: Application.get_env(:taddic_dot_com, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TaddicDotCom.PubSub},
      # Start a worker by calling: TaddicDotCom.Worker.start_link(arg)
      # {TaddicDotCom.Worker, arg},
      # Start to serve requests, typically the last entry
      TaddicDotComWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TaddicDotCom.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TaddicDotComWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
