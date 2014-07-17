class DashboardsController < ApplicationController
  def show
    @user = User.find_by(username: params[:id])
    @text_shout = TextShout.new
    @photo_shout = PhotoShout.new    
    @shouts = current_user.timeline
  end
end

