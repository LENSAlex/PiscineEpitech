defmodule Tp1.Repo.Migrations.CreateWorkingtime do
  use Ecto.Migration

  def change do
    create table(:workingtime, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :start, :utc_datetime
      add :end, :utc_datetime
      add :user, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:workingtime, [:user])
  end
end
