defmodule FirestormData.PostTest do
  alias FirestormData.{Category, User, Thread, Post, Repo}
  use ExUnit.Case

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
    {:ok, category} = %Category{title: "Elixir"} |> Repo.insert
    {:ok, otp} = %Thread{title: "OTP is neat", category_id: category.id} |> Repo.insert 
    {:ok, vishal} = %User{username: "vishal", email: "vishal.91@live.com", name: "Vishal Gautam"} |> Repo.insert 
    {:ok, category: category, otp: otp, vishal: vishal}
  end

  test "creating a post", %{otp: otp, vishal: vishal} do
    post_changeset =
      %Post{}
      |> Post.changeset(%{thread_id: otp.id, body: "Long live OTP", user_id: vishal.id})

    assert {:ok, _} = Repo.insert post_changeset 
  end

  describe "given some posts" do
    setup [:create_other_users, :create_sample_posts]

    test "finding a post by a user", %{post1: post1, vishal: vishal} do
      # We need to fill this out 
      assert True
    end
  end

  defp create_other_users(_) do
    vivek =
      %User{username: "Vicky", email: "vivek1234@gmail.com", name: "Vivek Gautam"}
      |> Repo.insert!

    {:ok, vivek: vivek}
  end

  defp create_sample_posts(%{otp: otp, vishal: vishal, vivek: vivek}) do
    post1 = 
      %Post{}
      |> Post.changeset(%{thread_id: otp.id, user_id: vishal.id, body: "Elixir is awesome"})
      |> Repo.insert!
    
    post2 =
      %Post{}
      |> Post.changeset(%{thread_id: otp.id, user_id: vivek.id, body: "Clojure and Elm are awesome"})
      |> Repo.insert!
    
    {:ok, post1: post1, post2: post2}
  end
end
