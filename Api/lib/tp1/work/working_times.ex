defmodule Tp1.Work.WorkingTimes do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "workingtime" do
    field :end, :utc_datetime
    field :start, :utc_datetime
    field :user, :binary_id

    timestamps()
  end

  @doc false
  def changeset(working_times, attrs) do
    working_times
    |> cast(attrs, [:start, :end, :user])
    |> validate_required([:start, :end, :user])
  end
end
