defmodule Budget.AuthController do
  use Budget.Web, :controller

  @doc """
    Login form
  """
  def index(conn, _params) do
    render conn, "index.html"
  end

  @doc """
    Create a link and send by e-mail (login)
  """
  def create(conn, %{"email" => email}) do
    json conn, %{status: "ok", email: email}
  end

  @doc """
    Show a authentication link (authenticate)
  """
  def show(conn, _params) do
    render conn, "index.html"
  end

  @doc """
    Delete a authentication (logout)
  """
  def delete(conn, _params) do
    render conn, "index.html"
  end
end
