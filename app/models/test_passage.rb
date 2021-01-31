class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', foreign_key: :question_id, optional: true

  PASS_PERCENT = 85

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_next_question

  def completed?
    current_question.nil?
  end

  def result_in_percent
    @result_in_percent ||= 100 / test.questions.count * correct_questions
  end

  def progress_percent(current)
    (100 / test.questions.count * current).to_i
  end

  def success?
    result_in_percent >= PASS_PERCENT
  end

  def accept!(answers_ids)
    self.correct_questions += 1 if correct_answer?(answers_ids)
    save!
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answers_ids)
    correct_answers.ids.sort == answers_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.right_answers
  end

  def before_update_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
