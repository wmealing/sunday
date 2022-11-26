defmodule Sunday.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SundayWeb.Telemetry,
      # Start the Ecto repository
      Sunday.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Sunday.PubSub},
      # Start Finch
      {Finch, name: Sunday.Finch},
      # Start the Endpoint (http/https)
      SundayWeb.Endpoint
      # Start a worker by calling: Sunday.Worker.start_link(arg)
      # {Sunday.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sunday.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SundayWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
