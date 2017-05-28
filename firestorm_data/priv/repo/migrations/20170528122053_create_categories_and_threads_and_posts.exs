defmodule FirestormData.Repo.Migrations.CreateCategoriesAndThreadsAndPosts do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :title, :string

      timestamps()
    end

    create table(:threads) do
      add :categpry_id, referemces(:categories)
      add :title, :string

      timestamps()
    end

    create index(:threads, [:categpry_id])

  end 
end
