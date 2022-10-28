defmodule ChatMutipleRoomsWeb.PageController do
  use ChatMutipleRoomsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
