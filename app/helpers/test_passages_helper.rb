module TestPassagesHelper

  def question_number(question)
    question.test.questions.order(:id).where('id <= ?', question.id).count
  end
end
