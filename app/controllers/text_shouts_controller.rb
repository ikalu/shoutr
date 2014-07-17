class TextShoutsController < ApplicationController
  def create
    text_shout = TextShout.new(text_shout_params)
    current_user.shouts.create(content: text_shout)
    

    redirect_to dashboard_path
  end

  private

  def text_shout_params
    params.
      require(:text_shout).
      permit(:body)
  end
end
