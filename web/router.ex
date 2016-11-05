defmodule Indie.Router do
 use Indie.Web, :router
 require Logger
  use Webmention.Router, %{
    root: :indie,
    webmention_callback: :callback,
    token_function: :token_function
  }
  pipeline :browser do
    plug :put_webmention_header
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Indie do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # # Other scopes may use custom stacks.
  # scope "/api", Indie do
  #   pipe_through :api

  #   post "/webmention", MentionController, :create_mention
  # end

  scope "/indie", Indie do
    pipe_through :api
    # post "/token", PageController, :token
    get "/test", PageController, :index
  end


  scope "/indie", Indie do
    pipe_through :browser
    get "/source", PageController, :source
  end

  def callback(content) do
    IO.inspect "YAY WE HAVE #{inspect content}"
  end

  def token_function(code) do
    "123"
  end

end
