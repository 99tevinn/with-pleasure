defmodule Tevinn.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TevinnWeb.Telemetry,
      Tevinn.Repo,
      {DNSCluster, query: Application.get_env(:tevinn, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Tevinn.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Tevinn.Finch},
      # Start a worker by calling: Tevinn.Worker.start_link(arg)
      # {Tevinn.Worker, arg},
      # Start to serve requests, typically the last entry
      TevinnWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Tevinn.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TevinnWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
