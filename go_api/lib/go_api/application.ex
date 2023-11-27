defmodule GoApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {GoApi.Spv, []},
      # Start the Telemetry supervisor
      GoApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: GoApi.PubSub},
      # Start the Endpoint (http/https)
      GoApiWeb.Endpoint
      # Start a worker by calling: GoApi.Worker.start_link(arg)
      # {GoApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GoApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GoApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
