defmodule Tp1Web.WorkingTimesView do
  use Tp1Web, :view
  alias Tp1Web.WorkingTimesView

  def render("index.json", %{workingtime: workingtime}) do
    %{data: render_many(workingtime, WorkingTimesView, "working_times.json")}
  end

  def render("show.json", %{working_times: working_times}) do
    %{data: render_one(working_times, WorkingTimesView, "working_times.json")}
  end

  def render("working_times.json", %{working_times: working_times}) do
    %{id: working_times.id,
      start: working_times.start,
      end: working_times.end}
  end
end
