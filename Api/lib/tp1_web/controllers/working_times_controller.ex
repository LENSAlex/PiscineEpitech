defmodule Tp1Web.WorkingTimesController do
  use Tp1Web, :controller

  alias Tp1.Work
  alias Tp1.Work.WorkingTimes

  action_fallback Tp1Web.FallbackController

  def index(conn, _params) do
    workingtime = Work.list_workingtime()
    render(conn, "index.json", workingtime: workingtime)
  end

  def create(conn, %{"working_times" => working_times_params, "userId" => id}) do
    tmp = %{"user" => id}
    tmp = Map.merge(working_times_params, tmp)

    with {:ok, %WorkingTimes{} = workingtime} <- Work.create_working_times(tmp) do
      tmp2 = Work.get_working_times!(workingtime.id)

      conn
      |> put_status(:created)
      |> render("show.json", working_times: tmp2)
    end
  end

  def show(conn, %{"start" => start, "end" => end_param, "id" => userId}) do
    working_times = Work.find(userId, start, end_param)
    render(conn, "index.json", working_times: working_times)
  end

  def show(conn, %{"userId" => user, "id" => id}) do
    working_times = Work.get_working_times2!(user, id)
    render(conn, "show.json", working_times: working_times)
  end

  def update(conn, %{"id" => id, "working_times" => working_times_params}) do
    working_times = Work.get_working_times!(id)

    with {:ok, %WorkingTimes{} = working_times} <-
           Work.update_working_times(working_times, working_times_params) do
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
