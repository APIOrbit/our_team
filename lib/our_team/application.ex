defmodule OurTeam.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      OurTeamWeb.Telemetry,
      OurTeam.Repo,
      {DNSCluster, query: Application.get_env(:our_team, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: OurTeam.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: OurTeam.Finch},
      # Start a worker by calling: OurTeam.Worker.start_link(arg)
      # {OurTeam.Worker, arg},
      # Start to serve requests, typically the last entry
      OurTeamWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OurTeam.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OurTeamWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
