class User < ApplicationRecord
  def test_passed(level)
    Test.joins('JOIN test_passeds ON tests.id = test_passeds.test_id')
        .where('test_passeds.user_id = :id AND level = :level', id: id, level: level)
  end
end
