defmodule OurTeamWeb.AboutController do
  use OurTeamWeb, :controller

  def about(conn, _params) do
    render(conn, :about)
  end
end
