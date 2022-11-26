defmodule Sunday.Repo.Migrations.CreateRebuilds do
  use Ecto.Migration

  def change do
    create table(:rebuilds) do
      add :rebuild_id, :integer
      add :build_id, :integer
      add :build_status, :string
      add :build_location, :string

      timestamps()
    end
  end
end
