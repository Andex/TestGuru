class FeedbacksController < ApplicationController

  # def index
  #   @feedbacks = Feedback.all
  # end

  def new
  end

  def create
    @feedback = feedback_params

    if @feedback
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