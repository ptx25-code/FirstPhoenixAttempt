defmodule Blogapp2Web.PostController do
  use Blogapp2Web, :controller

  alias Blogapp2.Posts
  alias Blogapp2.Posts.Post
  alias Blogapp2.Repo
  alias Blogapp2.Comments.Comment


  def index(conn, _params) do
    posts = Posts.list_posts()
    render(conn, :index, posts: posts)
  end

  def new(conn, _params) do
    changeset = Posts.change_post(%Post{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    case Posts.create_post(post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: ~p"/posts/#{post}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    post =
      id
      |> Posts.get_post!
      |> Repo.preload(:comments)

    changeset = Comment.changeset(%Comment{}, %{})
    render(conn, :show, post: post, changeset: changeset)
  end

  def edit(conn, %{"id" => id}) do
    post = Posts.get_post!(id)
    changeset = Posts.change_post(post)
    render(conn, :edit, post: post, changeset: changeset)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Posts.get_post!(id)

    case Posts.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: ~p"/posts/#{post}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, post: post, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Posts.get_post!(id)
    {:ok, _post} = Posts.delete_post(post)

    conn
    |> put_flash(:info, "Post deleted successfully.")
    |> redirect(to: ~p"/posts")
  end

  def add_comment(conn, %{"comment" => comment_params, "post_id" => post_id}) do
    post =
      post_id
      |> Posts.get_post!()
      |> Repo.preload(:comments)

    case Posts.add_comment(post_id, comment_params) do
      {:ok, _comment} ->
        conn
        |> put_flash(:info, "Added comment!")
        |> redirect(to: ~p"/posts/#{post}")
      {:error, _error} ->
        conn
        |> put_flash(:error, "Oops! Couldn't add comment!")
        |> redirect(to: ~p"/posts/#{post}")
	  end
  end

end
