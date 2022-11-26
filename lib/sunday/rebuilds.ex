defmodule Sunday.Rebuilds do
  @moduledoc """
  The Rebuilds context.
  """

  import Ecto.Query, warn: false
  alias Sunday.Repo

  alias Sunday.Rebuilds.Rebuild

  @doc """
  Returns the list of rebuilds.

  ## Examples

      iex> list_rebuilds()
      [%Rebuild{}, ...]

  """
  def list_rebuilds do
    Repo.all(Rebuild)
  end

  @doc """
  Gets a single rebuild.

  Raises `Ecto.NoResultsError` if the Rebuild does not exist.

  ## Examples

      iex> get_rebuild!(123)
      %Rebuild{}

      iex> get_rebuild!(456)
      ** (Ecto.NoResultsError)

  """
  def get_rebuild!(id), do: Repo.get!(Rebuild, id)

  @doc """
  Creates a rebuild.

  ## Examples

      iex> create_rebuild(%{field: value})
      {:ok, %Rebuild{}}

      iex> create_rebuild(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_rebuild(attrs \\ %{}) do
    %Rebuild{}
    |> Rebuild.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a rebuild.

  ## Examples

      iex> update_rebuild(rebuild, %{field: new_value})
      {:ok, %Rebuild{}}

      iex> update_rebuild(rebuild, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_rebuild(%Rebuild{} = rebuild, attrs) do
    rebuild
    |> Rebuild.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a rebuild.

  ## Examples

      iex> delete_rebuild(rebuild)
      {:ok, %Rebuild{}}

      iex> delete_rebuild(rebuild)
      {:error, %Ecto.Changeset{}}

  """
  def delete_rebuild(%Rebuild{} = rebuild) do
    Repo.delete(rebuild)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking rebuild changes.

  ## Examples

      iex> change_rebuild(rebuild)
      %Ecto.Changeset{data: %Rebuild{}}

  """
  def change_rebuild(%Rebuild{} = rebuild, attrs \\ %{}) do
    Rebuild.changeset(rebuild, attrs)
  end
end
