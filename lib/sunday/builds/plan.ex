defmodule Sunday.Builds.Plan do
  use Ecto.Schema
  import Ecto.Changeset

  schema "plans" do
    field :git_pkg_url, :string
    field :patch_url, :string
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(plan, attrs) do
    plan
    |> cast(attrs, [:user_id, :patch_url, :git_pkg_url])
    |> validate_required([:user_id, :patch_url, :git_pkg_url])
  end
end
