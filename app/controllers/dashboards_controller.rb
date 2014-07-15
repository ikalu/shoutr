class DashboardsController < ApplicationController
  def show
    @user = User.find_by(username: params[:id])
    @shout = Shout.new
    @shouts = current_user.shouts
  end
end

