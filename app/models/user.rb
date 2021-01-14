# require 'digest/sha1'

class User < ApplicationRecord

  include Auth

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_test, class_name: 'Test'

  def test_passage_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test_id: test.id)
  end
end
