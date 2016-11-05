defmodule Indie.PageController do
  use Indie.Web, :controller
  require Logger

  plug Webmention.Authorize, (&Indie.Callback.authorize/2) when action in [:private]

  def index(conn, _params) do
    render conn, "index.html"
  end

  def source(conn, _params) do
    render conn, "source.html"
  end

  def private(conn, params) do
    {:ok, content} = File.read("private/" <> params["slug"]) 
    render conn, "static.html", %{content: content}
  end


  def static(conn, params) do
    # Logger.debug inspect params
    {:ok, content} = File.read("content/" <> params["slug"]) 
    Logger.debug inspect content
    # conn |> send_resp(200, content)
    # conn |> send_resp(200, "test")
    render conn, "static.html", %{content: content}
  end

  def static_index(conn, _params) do
    {:ok, files} = File.ls("content")
    render conn, "static_index.html", %{files: files}
  end
end
