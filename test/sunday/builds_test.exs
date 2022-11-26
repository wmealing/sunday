defmodule Sunday.BuildsTest do
  use Sunday.DataCase

  alias Sunday.Builds

  describe "plans" do
    alias Sunday.Builds.Plan

    import Sunday.BuildsFixtures

    @invalid_attrs %{git_pkg_url: nil, patch_url: nil, user_id: nil}

    test "list_plans/0 returns all plans" do
      plan = plan_fixture()
      assert Builds.list_plans() == [plan]
    end

    test "get_plan!/1 returns the plan with given id" do
      plan = plan_fixture()
      assert Builds.get_plan!(plan.id) == plan
    end

    test "create_plan/1 with valid data creates a plan" do
      valid_attrs = %{git_pkg_url: "some git_pkg_url", patch_url: "some patch_url", user_id: 42}

      assert {:ok, %Plan{} = plan} = Builds.create_plan(valid_attrs)
      assert plan.git_pkg_url == "some git_pkg_url"
      assert plan.patch_url == "some patch_url"
      assert plan.user_id == 42
    end

    test "create_plan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Builds.create_plan(@invalid_attrs)
    end

    test "update_plan/2 with valid data updates the plan" do
      plan = plan_fixture()
      update_attrs = %{git_pkg_url: "some updated git_pkg_url", patch_url: "some updated patch_url", user_id: 43}

      assert {:ok, %Plan{} = plan} = Builds.update_plan(plan, update_attrs)
      assert plan.git_pkg_url == "some updated git_pkg_url"
      assert plan.patch_url == "some updated patch_url"
      assert plan.user_id == 43
    end

    test "update_plan/2 with invalid data returns error changeset" do
      plan = plan_fixture()
      assert {:error, %Ecto.Changeset{}} = Builds.update_plan(plan, @invalid_attrs)
      assert plan == Builds.get_plan!(plan.id)
    end

    test "delete_plan/1 deletes the plan" do
      plan = plan_fixture()
      assert {:ok, %Plan{}} = Builds.delete_plan(plan)
      assert_raise Ecto.NoResultsError, fn -> Builds.get_plan!(plan.id) end
    end

    test "change_plan/1 returns a plan changeset" do
      plan = plan_fixture()
      assert %Ecto.Changeset{} = Builds.change_plan(plan)
    end
  end
end
