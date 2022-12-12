defmodule CountriesApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: CountriesApi.Router, options: [port: 8080]}
      # Starts a worker by calling: CountriesApi.Worker.start_link(arg)
      # {CountriesApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CountriesApi.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
