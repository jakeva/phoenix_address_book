defmodule AddressBookWeb.PageController do
  use AddressBookWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
