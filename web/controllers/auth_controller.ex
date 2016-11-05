defmodule Budget.AuthController do
  use Budget.Web, :controller

  import Budget.Router.Helpers
  alias Budget.Endpoint

  @auth_code_length 32
  @auth_session_length 12

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
    session_code = SecureRandom.hex(@auth_session_length)
    auth_code = SecureRandom.hex(@auth_code_length)
    url = auth_url(Endpoint, :show, session_code, [code: auth_code])
    json conn, %{
      session: session_code,
      email: email,
      dbg_url: url
    }
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
