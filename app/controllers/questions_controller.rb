class QuestionsController < ApplicationController

  before_action :find_test, only: %i[create index]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    result = "#{params.inspect}\n\n"
    @test.questions.each do |question|
      result += "id: #{question.id}, test_id: #{question.test_id}, body: #{question.body}\n"
    end
    render plain: result
  end

  def show
    render plain: @question.body
  end

  def new; end

  def create
    @question = @test.questions.create(question_params)
    # render plain: @question.inspect
  end

  def destroy
    @question.destroy
    redirect_to @question.test
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
