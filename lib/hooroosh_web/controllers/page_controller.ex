defmodule HoorooshWeb.PageController do
  use HoorooshWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
