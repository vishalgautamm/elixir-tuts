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
end
