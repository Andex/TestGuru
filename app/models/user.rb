class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_test, class_name: 'Test'

  def test_passage(level)
    Test.joins('JOIN test_passages ON tests.id = test_passages.test_id')
        .where('test_passages.user_id = :id AND level = :level', id: id, level: level)
  end
end
