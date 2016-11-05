defmodule Indie.Callback do
  require Logger

  @doc """
  Module to store indieweb callbacks
  """


  def authorize(conn, token) do
    Logger.debug inspect token
    Logger.debug inspect conn.params
    # true
    cond do
      token == "123" -> true
      true -> false
    end
  end
end




