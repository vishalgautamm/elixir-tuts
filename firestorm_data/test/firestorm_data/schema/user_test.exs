defmodule FirestormData.UserTest do
  alias FirestormData.{User, Repo}

  use ExUnit.Case

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  test "creating a user" do
    vishal = %User{name: "Vishal Gautam"}
    assert = {:ok, _} = Repo.insert vishal
  end

end
