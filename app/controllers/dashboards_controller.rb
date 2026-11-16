class DashboardsController < ApplicationController
  def show
    render Views::Dashboards::Show.new(user: Current.user)
  end
end
