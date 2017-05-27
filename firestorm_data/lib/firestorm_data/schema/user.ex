defmodule FirestormData.User do
  use Ecto.Schema
  
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :name, :string
    field :email, :string

    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:username, :name, :email])
    |> validate_required([:email])
    |> valudate_format(:email, ~r/@/)
  end

end
