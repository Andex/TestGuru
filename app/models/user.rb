class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_test, class_name: 'Test'

  def test_passage_by_level(level)
    tests.where(level: level)
  end
end
