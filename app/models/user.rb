class User < ApplicationRecord
  def test_passed(level)
    Test.joins('JOIN test_passages ON tests.id = test_passages.test_id')
        .where('test_passages.user_id = :id AND level = :level', id: id, level: level)
  end
end
