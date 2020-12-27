class QuestionsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  # def show
  #   render json:
  # end

  def new
  end

  def index
    render plain: params.inspect
  end

  private

  def rescue_with_question_not_found
    render plain: "Вопрос не найден"
  end
end
