class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answers_ids])

    if @test_passage.completed? || @test_passage.time_is_over?
      @test_passage.test_status_passed
      BadgeService.new(@test_passage).call if @test_passage.passed
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    result = service.call

    if service.response_success?
      flash_options = { notice: t('.success', gist_link: view_context.link_to('Gist', result.html_url, target: '_blank')) }
      current_user.gists.create(question_id: @test_passage.current_question.id, url: result.html_url)
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
