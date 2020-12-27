class QuestionsController < ApplicationController

  before_action :find_test, only: ['create']
  before_action :find_question, only: ['show']
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: params.inspect
  end

  def show
    render plain: @question.body
  end

  def new; end

  def create
    @question = @test.questions.new(question_params)
    @question.save
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
