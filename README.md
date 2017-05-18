# OneSignal

Elixir wrapper of [OneSignal](https://onesignal.com)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add one_signal to your list of dependencies in `mix.exs`:

```elixir
  def deps do
    [{:one_signal, "~> 0.0.6"}]
  end
```

  2. Ensure one_signal is started before your application:

```elixir
  def application do
    [applications: [:one_signal]]
  end
```

  3. Puts config your `config.exs`

```elixir
config :one_signal, OneSignal,
  api_key: "your api key",
  app_id: "your app id",
```

  4. When you need to config more than one OneSign app

```elixir
config :one_signal, OneSignal,
  api_key: "your api key",
  app_id: "your app id",
  app_2_api_key: "your api key",
  app_2_app_id: "your app id",
```


## Composable design, Data structure oriented

```elixir
  import OneSignal.Param
  OneSignal.new
  |> put_heading("Welcome!")
  |> put_message(:en, "Hello")
  |> put_message(:ja, "はろー")
  |> put_segment("Free Players")
  |> put_segment("New Players")
  |> notify
```

```elixir
  import OneSignal.Param
  OneSignal.new
  |> put_heading("Welcome!")
  |> put_message(:en, "Hello")
  |> put_message(:ja, "はろー")
  |> put_segment("Free Players")
  |> put_segment("New Players")
  |> notify(:app_2)
```
