defmodule GoApiWeb.Router do
  use GoApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GoApiWeb do
    pipe_through :api
  end
end
