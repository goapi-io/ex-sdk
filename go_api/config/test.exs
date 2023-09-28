import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :go_api, GoApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "HeRAnRNYNqR8/kzi7YBIpetsTbIyU2F2OZ5dgDnknMJwEznLOwtqXY+gr5TDm4b9",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
