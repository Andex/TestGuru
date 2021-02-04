class FeedbacksController < ApplicationController

  def new
  end

  def create
    @feedback = feedback_params

    if @feedback
      @feedback[:user] = current_user
      FeedbacksMailer.send_feedback(@feedback).deliver_now
      redirect_to tests_path, notice: 'Ваше сообщение отправлено'
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:topic, :message_text)
  end
end