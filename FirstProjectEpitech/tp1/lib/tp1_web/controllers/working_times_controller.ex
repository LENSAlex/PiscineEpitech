defmodule Tp1Web.WorkingTimesController do
  use Tp1Web, :controller

  alias Tp1.Work
  alias Tp1.Work.WorkingTimes

  action_fallback Tp1Web.FallbackController

  def index(conn, _params) do
    workingtime = Work.list_workingtime()
    render(conn, "index.json", workingtime: workingtime)
  end

  def create(conn, %{"working_times" => working_times_params}) do
    with {:ok, %WorkingTimes{} = working_times} <- Work.create_working_times(working_times_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.working_times_path(conn, :show, working_times))
      |> render("show.json", working_times: working_times)
    end
  end

  def show(conn, %{"id" => id}) do
    working_times = Work.get_working_times!(id)
    render(conn, "show.json", working_times: working_times)
  end

  def update(conn, %{"id" => id, "working_times" => working_times_params}) do
    working_times = Work.get_working_times!(id)

    with {:ok, %WorkingTimes{} = working_times} <- Work.update_working_times(working_times, working_times_params) do
      render(conn, "show.json", working_times: working_times)
    end
  end

  def delete(conn, %{"id" => id}) do
    working_times = Work.get_working_times!(id)

    with {:ok, %WorkingTimes{}} <- Work.delete_working_times(working_times) do
      send_resp(conn, :no_content, "")
    end
  end
end
