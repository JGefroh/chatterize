defmodule Chatterize.Router do
  use Chatterize.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Chatterize do
    pipe_through :browser # Use the default browser stack
    get "/about", AboutController, :index
    get "/about/:messenger", AboutController, :show
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Chatterize do
  #   pipe_through :api
  # end
end
