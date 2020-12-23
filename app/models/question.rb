class Question < ApplicationRecord
  has_many :answers

  belongs_to :test

  validates :body, presence: true
  validate :validate_max_questions

  private

  def validate_max_questions
    errors.add(:answer) if answers.ids.count.positive? && answers.ids.count <= 4
  end
end
