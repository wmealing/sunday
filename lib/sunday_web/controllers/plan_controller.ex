defmodule SundayWeb.PlanController do
  use SundayWeb, :controller

  alias Sunday.Builds
  alias Sunday.Builds.Plan

  def index(conn, _params) do
    plans = Builds.list_plans()
    render(conn, :index, plans: plans)
  end

  def new(conn, _params) do
    changeset = Builds.change_plan(%Plan{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"plan" => plan_params}) do
    case Builds.create_plan(plan_params) do
      {:ok, plan} ->
        conn
        |> put_flash(:info, "Plan created successfully.")
        |> redirect(to: ~p"/plans/#{plan}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    plan = Builds.get_plan!(id)
    render(conn, :show, plan: plan)
  end

  def edit(conn, %{"id" => id}) do
    plan = Builds.get_plan!(id)
    changeset = Builds.change_plan(plan)
    render(conn, :edit, plan: plan, changeset: changeset)
  end

  def update(conn, %{"id" => id, "plan" => plan_params}) do
    plan = Builds.get_plan!(id)

    case Builds.update_plan(plan, plan_params) do
      {:ok, plan} ->
        conn
        |> put_flash(:info, "Plan updated successfully.")
        |> redirect(to: ~p"/plans/#{plan}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, plan: plan, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    plan = Builds.get_plan!(id)
    {:ok, _plan} = Builds.delete_plan(plan)

    conn
    |> put_flash(:info, "Plan deleted successfully.")
    |> redirect(to: ~p"/plans")
  end
end
