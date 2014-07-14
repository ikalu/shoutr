class HomesController < ApplicationController
  skip_before_action :require_login

  def show
    @user = User.new
  end

  def require_login
    if !signed_in?
      redirect_to new_session_path
    end
  end
end
