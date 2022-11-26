defmodule Sunday.BuildsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sunday.Builds` context.
  """

  @doc """
  Generate a plan.
  """
  def plan_fixture(attrs \\ %{}) do
    {:ok, plan} =
      attrs
      |> Enum.into(%{
        git_pkg_url: "some git_pkg_url",
        patch_url: "some patch_url",
        user_id: 42
      })
      |> Sunday.Builds.create_plan()

    plan
  end
end
