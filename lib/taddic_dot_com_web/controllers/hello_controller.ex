defmodule TaddicDotComWeb.HelloController do
  use TaddicDotComWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
