defmodule Budget.AuthController do
  use Budget.Web, :controller

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
    auth_code = "session:" <> session_code <> ";code:" <> SecureRandom.hex(@auth_code_length)
    json conn, %{
      session: session_code,
      email: email,
      dbg_auth_code: auth_code
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
