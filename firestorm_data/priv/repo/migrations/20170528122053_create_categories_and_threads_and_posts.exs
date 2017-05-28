defmodule FirestormData.Repo.Migrations.CreateCategoriesAndThreadsAndPosts do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :title, :string

      timestamps()
    end

    create table(:threads) do
      add :categpry_id, references(:categories)
      add :title, :string

      timestamps()
    end

    create index(:threads, [:category_id])
    # Posts belong to a thread and a user, and have a body
    create table(:posts) do
      add :thread_id, references(:threads)
      add :body, :text
      add :user_id, references(:users)

      timestamps()
    end
    # Index posts by thread and user
    create index(:posts, [:thread_id])
    create index(:posts, [:user_id])
  end 
end
