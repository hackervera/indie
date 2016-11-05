defmodule Indie.PageView do
  use Indie.Web, :view

  def render("token.json", %{}) do
    %{access_token: "123", token_type: "bearer", expires_in: 3600}
  end
end
