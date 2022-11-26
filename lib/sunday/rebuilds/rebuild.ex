defmodule Sunday.Rebuilds.Rebuild do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rebuilds" do
    field :build_id, :integer
    field :build_location, :string
    field :build_status, :string
    field :rebuild_id, :integer

    timestamps()
  end

  @doc false
  def changeset(rebuild, attrs) do
    rebuild
    |> cast(attrs, [:rebuild_id, :build_id, :build_status, :build_location])
    |> validate_required([:rebuild_id, :build_id, :build_status, :build_location])
  end
end
