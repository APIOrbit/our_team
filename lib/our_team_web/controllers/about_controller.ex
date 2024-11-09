defmodule OurTeamWeb.AboutController do
  use OurTeamWeb, :controller

  alias OurTeamWeb.AboutHTML

  def about(conn, _params) do

    conn = put_view(conn, html: AboutHTML)
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :about, layout: false)
  end
end
