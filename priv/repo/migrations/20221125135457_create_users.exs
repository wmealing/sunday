defmodule Sunday.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :active, :boolean, default: false, null: false

      timestamps()
    end
  end
end
