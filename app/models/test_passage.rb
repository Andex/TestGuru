class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', foreign_key: :question_id, optional: true

  before_validation :before_validation_set_first_question, on: :create

  def accept!(answers_ids)
    self.correct_questions += 1 if correct_answer?(answers_ids)

    self.current_question = next_question
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

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
