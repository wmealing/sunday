defmodule Sunday.RebuildsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sunday.Rebuilds` context.
  """

  @doc """
  Generate a rebuild.
  """
  def rebuild_fixture(attrs \\ %{}) do
    {:ok, rebuild} =
      attrs
      |> Enum.into(%{
        build_id: 42,
        build_location: "some build_location",
        build_status: "some build_status",
        rebuild_id: 42
      })
      |> Sunday.Rebuilds.create_rebuild()

    rebuild
  end
end
