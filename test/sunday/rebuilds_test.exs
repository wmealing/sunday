defmodule Sunday.RebuildsTest do
  use Sunday.DataCase

  alias Sunday.Rebuilds

  describe "rebuilds" do
    alias Sunday.Rebuilds.Rebuild

    import Sunday.RebuildsFixtures

    @invalid_attrs %{build_id: nil, build_location: nil, build_status: nil, rebuild_id: nil}

    test "list_rebuilds/0 returns all rebuilds" do
      rebuild = rebuild_fixture()
      assert Rebuilds.list_rebuilds() == [rebuild]
    end

    test "get_rebuild!/1 returns the rebuild with given id" do
      rebuild = rebuild_fixture()
      assert Rebuilds.get_rebuild!(rebuild.id) == rebuild
    end

    test "create_rebuild/1 with valid data creates a rebuild" do
      valid_attrs = %{build_id: 42, build_location: "some build_location", build_status: "some build_status", rebuild_id: 42}

      assert {:ok, %Rebuild{} = rebuild} = Rebuilds.create_rebuild(valid_attrs)
      assert rebuild.build_id == 42
      assert rebuild.build_location == "some build_location"
      assert rebuild.build_status == "some build_status"
      assert rebuild.rebuild_id == 42
    end

    test "create_rebuild/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Rebuilds.create_rebuild(@invalid_attrs)
    end

    test "update_rebuild/2 with valid data updates the rebuild" do
      rebuild = rebuild_fixture()
      update_attrs = %{build_id: 43, build_location: "some updated build_location", build_status: "some updated build_status", rebuild_id: 43}

      assert {:ok, %Rebuild{} = rebuild} = Rebuilds.update_rebuild(rebuild, update_attrs)
      assert rebuild.build_id == 43
      assert rebuild.build_location == "some updated build_location"
      assert rebuild.build_status == "some updated build_status"
      assert rebuild.rebuild_id == 43
    end

    test "update_rebuild/2 with invalid data returns error changeset" do
      rebuild = rebuild_fixture()
      assert {:error, %Ecto.Changeset{}} = Rebuilds.update_rebuild(rebuild, @invalid_attrs)
      assert rebuild == Rebuilds.get_rebuild!(rebuild.id)
    end

    test "delete_rebuild/1 deletes the rebuild" do
      rebuild = rebuild_fixture()
      assert {:ok, %Rebuild{}} = Rebuilds.delete_rebuild(rebuild)
      assert_raise Ecto.NoResultsError, fn -> Rebuilds.get_rebuild!(rebuild.id) end
    end

    test "change_rebuild/1 returns a rebuild changeset" do
      rebuild = rebuild_fixture()
      assert %Ecto.Changeset{} = Rebuilds.change_rebuild(rebuild)
    end
  end
end
