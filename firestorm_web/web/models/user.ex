defmodule FirestormWeb.User do
  use FirestormWeb.Web, :model

  schema "users" do
    field :username, :string
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :email, :name])
    |> validate_required([:username, :email, :name])
  end
end
