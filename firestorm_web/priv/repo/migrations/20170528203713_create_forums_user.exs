defmodule FirestormWeb.Repo.Migrations.CreateForums.User do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string
      add :name, :string

      timestamps()
    end

  end
end
