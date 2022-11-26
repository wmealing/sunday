defmodule SundayWeb.RebuildController do
  use SundayWeb, :controller

  alias Sunday.Rebuilds
  alias Sunday.Rebuilds.Rebuild

  def index(conn, _params) do
    rebuilds = Rebuilds.list_rebuilds()
    render(conn, :index, rebuilds: rebuilds)
  end

  def new(conn, _params) do
    changeset = Rebuilds.change_rebuild(%Rebuild{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"rebuild" => rebuild_params}) do
    case Rebuilds.create_rebuild(rebuild_params) do
      {:ok, rebuild} ->
        conn
        |> put_flash(:info, "Rebuild created successfully.")
        |> redirect(to: ~p"/rebuilds/#{rebuild}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    rebuild = Rebuilds.get_rebuild!(id)
    render(conn, :show, rebuild: rebuild)
  end

  def edit(conn, %{"id" => id}) do
    rebuild = Rebuilds.get_rebuild!(id)
    changeset = Rebuilds.change_rebuild(rebuild)
    render(conn, :edit, rebuild: rebuild, changeset: changeset)
  end

  def update(conn, %{"id" => id, "rebuild" => rebuild_params}) do
    rebuild = Rebuilds.get_rebuild!(id)

    case Rebuilds.update_rebuild(rebuild, rebuild_params) do
      {:ok, rebuild} ->
        conn
        |> put_flash(:info, "Rebuild updated successfully.")
        |> redirect(to: ~p"/rebuilds/#{rebuild}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, rebuild: rebuild, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    rebuild = Rebuilds.get_rebuild!(id)
    {:ok, _rebuild} = Rebuilds.delete_rebuild(rebuild)

    conn
    |> put_flash(:info, "Rebuild deleted successfully.")
    |> redirect(to: ~p"/rebuilds")
  end
end
