defmodule OneSignal do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OneSignal.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def endpoint, do: "https://onesignal.com/api/v1"

  def new do
    %OneSignal.Param{}
  end

  def auth_header(app_name \\ "") do
    %{"Authorization" => "Basic " <> fetch_api_key(app_name),
      "Content-type" => "application/json"}
  end

  defp config do
    Application.get_env(:one_signal, OneSignal)
  end

  defp fetch_api_key(app_name \\ "") do
    config()[config_key(app_name, :api_key)] ||
      System.get_env(config_name(app_name, "ONE_SIGNAL_API_KEY"))
  end

  def fetch_app_id(app_name \\ "") do
    config()[config_key(app_name, :app_id)] ||
      System.get_env(config_name(app_name, "ONE_SIGNAL_APP_ID"))
  end

  defp config_key("", key), do: key
  defp config_key(app_name, key), do: "#{app_name}_#{key}" |> String.to_atom

  defp config_name("", name), do: name
  defp config_name(app_name, name), do: "#{app_name}_#{name}" |> String.upcase

end
