module TestPassagesHelper

  def question_number(question)
    question.test.questions.order(:id).where('id <= ?', question.id).count
  end

  def result(test_passage)
    100 / test_passage.test.questions.count * test_passage.correct_questions
  end
end
