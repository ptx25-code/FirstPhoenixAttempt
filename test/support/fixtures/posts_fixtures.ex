defmodule Blogapp2.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Blogapp2.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> Blogapp2.Posts.create_post()

    post
  end
end
