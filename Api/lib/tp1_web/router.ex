defmodule Tp1Web.Router do
  use Tp1Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Tp1Web do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/clocks", ClockController, except: [:new, :edit]
    resources "/workingtimes", WorkingTimesController, except: [:new, :edit]
    post "/clocks/:id", ClockController, :create
    post "/workingtimes/:userId", WorkingTimesController, :create
    get "/workingtimes/:userId/:id", WorkingTimesController, :show
    get "/users/all", UserController, :index1
  end


end
