defmodule HoorooshWeb.PageController do
  use HoorooshWeb, :controller

  def index(conn, _params) do
    count = Hooroosh.Repo.aggregate(Hooroosh.User, :count, :id)
    conn
    |> assign(:count, count)
    |> render("index.html")
  end
end
