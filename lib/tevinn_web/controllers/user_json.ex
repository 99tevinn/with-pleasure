defmodule TevinnWeb.UserJSON do
  alias TevinnWeb.PostJSON
  alias Tevinn.Accounts.User

  @doc """
  Renders a list of users.
  """
  def index(%{users: users}) do
    %{data: for(user <- users, do: data(user))}
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{data: data(user)}
  end

  def data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      posts: Enum.map(user.posts, &PostJSON.data/1)
    }
  end

  #defp post_data(%Post{} = post) do
    #%{
     # id: post.id,
      #title: post.title,
      #body: post.body
    #}
  #end
end
