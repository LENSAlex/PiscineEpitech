defmodule Tp1.WorkTest do
  use Tp1.DataCase

  alias Tp1.Work

  describe "workingtime" do
    alias Tp1.Work.WorkingTimes

    @valid_attrs %{end: "some end", start: "some start"}
    @update_attrs %{end: "some updated end", start: "some updated start"}
    @invalid_attrs %{end: nil, start: nil}

    def working_times_fixture(attrs \\ %{}) do
      {:ok, working_times} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Work.create_working_times()

      working_times
    end

    test "list_workingtime/0 returns all workingtime" do
      working_times = working_times_fixture()
      assert Work.list_workingtime() == [working_times]
    end

    test "get_working_times!/1 returns the working_times with given id" do
      working_times = working_times_fixture()
      assert Work.get_working_times!(working_times.id) == working_times
    end

    test "create_working_times/1 with valid data creates a working_times" do
      assert {:ok, %WorkingTimes{} = working_times} = Work.create_working_times(@valid_attrs)
      assert working_times.end == "some end"
      assert working_times.start == "some start"
    end

    test "create_working_times/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Work.create_working_times(@invalid_attrs)
    end

    test "update_working_times/2 with valid data updates the working_times" do
      working_times = working_times_fixture()
      assert {:ok, %WorkingTimes{} = working_times} = Work.update_working_times(working_times, @update_attrs)
      assert working_times.end == "some updated end"
      assert working_times.start == "some updated start"
    end

    test "update_working_times/2 with invalid data returns error changeset" do
      working_times = working_times_fixture()
      assert {:error, %Ecto.Changeset{}} = Work.update_working_times(working_times, @invalid_attrs)
      assert working_times == Work.get_working_times!(working_times.id)
    end

    test "delete_working_times/1 deletes the working_times" do
      working_times = working_times_fixture()
      assert {:ok, %WorkingTimes{}} = Work.delete_working_times(working_times)
      assert_raise Ecto.NoResultsError, fn -> Work.get_working_times!(working_times.id) end
    end

    test "change_working_times/1 returns a working_times changeset" do
      working_times = working_times_fixture()
      assert %Ecto.Changeset{} = Work.change_working_times(working_times)
    end
  end
end
