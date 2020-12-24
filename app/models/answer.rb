class Answer < ApplicationRecord
  ANSWERS_MAX = 4

  belongs_to :question

  validates :body, presence: true
  validate :validate_max_answers

  scope :right_answers, -> { where(correct: true) }

  private

  def validate_max_answers
    errors.add(:question, "Превышено число ответов к тесту, максимально: #{ANSWERS_MAX}") if question.answers.size > ANSWERS_MAX
  end
end
