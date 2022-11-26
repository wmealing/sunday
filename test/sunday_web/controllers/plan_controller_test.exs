defmodule SundayWeb.PlanControllerTest do
  use SundayWeb.ConnCase

  import Sunday.BuildsFixtures

  @create_attrs %{git_pkg_url: "some git_pkg_url", patch_url: "some patch_url", user_id: 42}
  @update_attrs %{git_pkg_url: "some updated git_pkg_url", patch_url: "some updated patch_url", user_id: 43}
  @invalid_attrs %{git_pkg_url: nil, patch_url: nil, user_id: nil}

  describe "index" do
    test "lists all plans", %{conn: conn} do
      conn = get(conn, ~p"/plans")
      assert html_response(conn, 200) =~ "Listing Plans"
    end
  end

  describe "new plan" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/plans/new")
      assert html_response(conn, 200) =~ "New Plan"
    end
  end

  describe "create plan" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/plans", plan: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/plans/#{id}"

      conn = get(conn, ~p"/plans/#{id}")
      assert html_response(conn, 200) =~ "Plan #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/plans", plan: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Plan"
    end
  end

  describe "edit plan" do
    setup [:create_plan]

    test "renders form for editing chosen plan", %{conn: conn, plan: plan} do
      conn = get(conn, ~p"/plans/#{plan}/edit")
      assert html_response(conn, 200) =~ "Edit Plan"
    end
  end

  describe "update plan" do
    setup [:create_plan]

    test "redirects when data is valid", %{conn: conn, plan: plan} do
      conn = put(conn, ~p"/plans/#{plan}", plan: @update_attrs)
      assert redirected_to(conn) == ~p"/plans/#{plan}"

      conn = get(conn, ~p"/plans/#{plan}")
      assert html_response(conn, 200) =~ "some updated git_pkg_url"
    end

    test "renders errors when data is invalid", %{conn: conn, plan: plan} do
      conn = put(conn, ~p"/plans/#{plan}", plan: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Plan"
    end
  end

  describe "delete plan" do
    setup [:create_plan]

    test "deletes chosen plan", %{conn: conn, plan: plan} do
      conn = delete(conn, ~p"/plans/#{plan}")
      assert redirected_to(conn) == ~p"/plans"

      assert_error_sent 404, fn ->
        get(conn, ~p"/plans/#{plan}")
      end
    end
  end

  defp create_plan(_) do
    plan = plan_fixture()
    %{plan: plan}
  end
end
