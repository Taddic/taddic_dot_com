defmodule TaddicDotComWeb.PageController do
  use TaddicDotComWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
