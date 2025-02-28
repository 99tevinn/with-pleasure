defmodule TevinnWeb.PageController do
  use TevinnWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def users(conn, _params) do
    users = [
      %{id: 1, name: "Tevin", email: "tev@gmail.com"},
      %{id: 2, name: "Dani", email: "dani@gmail.com"}
    ]

    json(conn, %{users: users})
  end
end
