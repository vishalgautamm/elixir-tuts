defmodule FirestormData.UserTest do
  alias FirestormData.{User, Repo}

  use ExUnit.Case

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  test "creating a user" do
    vishal_changeset =
      %User{}
      |> User.changeset(%{name: "Vishal Gautam", email: "vishal.91@live.com"})

    assert = {:ok, _} = Repo.insert vishal_changeset 
  end

  test "creating a user without an email" do
    vishal_changeset =
      %User{}
      |> User.changeset(%{name: "Vishal Gautam"})

    assert {:email, {"can't be blank", [validation: :required]}} in vishal_changeset.errors
  end

  test "creating a user with an invalid email" do
    vishal_changeset =
      %User{}
      |> User.changeset(%{name: "Vishal Gautam", email: "wrongemail"})

    refute vishal_changeset.valid?
  end

end
