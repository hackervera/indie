defmodule Indie.PageController do
  use Indie.Web, :controller
  require Logger
  plug Webmention.Authorize, Indie.Callback.authorize when action in [:source]

  def index(conn, _params) do
    render conn, "index.html"
  end

  def source(conn, _params) do
    render conn, "source.html"
  end

  def token(conn, _params) do
    render conn, "token.json"
  end
end
