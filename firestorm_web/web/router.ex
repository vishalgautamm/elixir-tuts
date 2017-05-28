defmodule FirestormWeb.Router do
  use FirestormWeb.Web, :router

  # In Phoenix you set up pipelines for various plugs.
  # Plugs take a `Plug.Conn` and modify it - this is the default browser stack
  # that Phoenix installs.
  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # Here's a separate default pipeline for API endpoints
  pipeline :api do
    plug :accepts, ["json"]
  end

  # When a request comes through for the root, this scope is applied.
  # The second argument it the default namespace that we will use internally -
  # this way we can avoid prefixing everything with FirestormWeb.Web
  scope "/", FirestormWeb do
    pipe_through :browser # Use the default browser stack

    # When someone `GET`s the root path, we'll handle the request with the
    # `PageController`'s `index` function.
    get "/", PageController, :index
    resources "/users", Forums.UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", FirestormWeb do
  #   pipe_through :api
  # end
end
