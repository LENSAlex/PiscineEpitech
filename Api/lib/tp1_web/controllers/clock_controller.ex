defmodule Tp1Web.ClockController do
  use Tp1Web, :controller

  alias Tp1.Clocking
  alias Tp1.Clocking.Clock

  action_fallback Tp1Web.FallbackController

  def index(conn, _params) do
    clocks = Clocking.list_clocks()
    render(conn, "index.json", clocks: clocks)
  end

  def create(conn, %{"clock" => clock_params, "id" => id}) do
    tmp = %{"user" => id}
    tmp = Map.merge(clock_params, tmp)
    with {:ok, %Clock{} = clock} <- Clocking.create_clock(tmp) do
      tmp2 = Clocking.get_clock!(clock.id)
      conn
      |> put_status(:created)
      |> render("show.json", clock: tmp2)
    end
  end

  def show(conn, %{"id" => id}) do
    clock = Clocking.get_clock2(id)
    render(conn, "index.json", clocks: clock)
  end

  def update(conn, %{"id" => id, "clock" => clock_params}) do
    clock = Clocking.get_clock!(id)

    with {:ok, %Clock{} = clock} <- Clocking.update_clock(clock, clock_params) do
      render(conn, "show.json", clock: clock)
    end
  end

  def delete(conn, %{"id" => id}) do
    clock = Clocking.get_clock!(id)

    with {:ok, %Clock{}} <- Clocking.delete_clock(clock) do
      send_resp(conn, :no_content, "")
    end
  end
end
