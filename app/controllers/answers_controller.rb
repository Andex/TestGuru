class AnswersController < ApplicationController
  before_action :set_answer, only: %i[show edit update destroy]

  # GET /answers
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  def show
  end

  # GET /answers/new
  def new
    @answer = @question.answers.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      redirect_to @answer
    else
      render :new
    end
  end

  # PATCH/PUT /answers/1
  def update
    if @answer.update(answer_params)
      redirect_to @answer
    else
      render :new
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    redirect_to question_answers_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  # Only allow a list of trusted parameters through.
  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
