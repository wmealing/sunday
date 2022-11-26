defmodule SundayWeb.RebuildControllerTest do
  use SundayWeb.ConnCase

  import Sunday.RebuildsFixtures

  @create_attrs %{build_id: 42, build_location: "some build_location", build_status: "some build_status", rebuild_id: 42}
  @update_attrs %{build_id: 43, build_location: "some updated build_location", build_status: "some updated build_status", rebuild_id: 43}
  @invalid_attrs %{build_id: nil, build_location: nil, build_status: nil, rebuild_id: nil}

  describe "index" do
    test "lists all rebuilds", %{conn: conn} do
      conn = get(conn, ~p"/rebuilds")
      assert html_response(conn, 200) =~ "Listing Rebuilds"
    end
  end

  describe "new rebuild" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/rebuilds/new")
      assert html_response(conn, 200) =~ "New Rebuild"
    end
  end

  describe "create rebuild" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/rebuilds", rebuild: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/rebuilds/#{id}"

      conn = get(conn, ~p"/rebuilds/#{id}")
      assert html_response(conn, 200) =~ "Rebuild #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/rebuilds", rebuild: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Rebuild"
    end
  end

  describe "edit rebuild" do
    setup [:create_rebuild]

    test "renders form for editing chosen rebuild", %{conn: conn, rebuild: rebuild} do
      conn = get(conn, ~p"/rebuilds/#{rebuild}/edit")
      assert html_response(conn, 200) =~ "Edit Rebuild"
    end
  end

  describe "update rebuild" do
    setup [:create_rebuild]

    test "redirects when data is valid", %{conn: conn, rebuild: rebuild} do
      conn = put(conn, ~p"/rebuilds/#{rebuild}", rebuild: @update_attrs)
      assert redirected_to(conn) == ~p"/rebuilds/#{rebuild}"

      conn = get(conn, ~p"/rebuilds/#{rebuild}")
      assert html_response(conn, 200) =~ "some updated build_location"
    end

    test "renders errors when data is invalid", %{conn: conn, rebuild: rebuild} do
      conn = put(conn, ~p"/rebuilds/#{rebuild}", rebuild: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Rebuild"
    end
  end

  describe "delete rebuild" do
    setup [:create_rebuild]

    test "deletes chosen rebuild", %{conn: conn, rebuild: rebuild} do
      conn = delete(conn, ~p"/rebuilds/#{rebuild}")
      assert redirected_to(conn) == ~p"/rebuilds"

      assert_error_sent 404, fn ->
        get(conn, ~p"/rebuilds/#{rebuild}")
      end
    end
  end

  defp create_rebuild(_) do
    rebuild = rebuild_fixture()
    %{rebuild: rebuild}
  end
end
