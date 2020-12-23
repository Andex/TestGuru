class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_max_answers

  scope :right_answers, -> { where(correct: true) }

  private

  def validate_max_answers
    errors.add(:base) unless question.answers.ids.count <= 4
  end
end
