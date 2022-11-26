defmodule Sunday.Repo.Migrations.CreatePlans do
  use Ecto.Migration

  def change do
    create table(:plans) do
      add :user_id, :integer
      add :patch_url, :string
      add :git_pkg_url, :string

      timestamps()
    end
  end
end
