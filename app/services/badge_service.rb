class BadgeService

  TEST_LEVELS = { 0 => 'easy',
                  1 => 'easy',
                  2 => 'middle',
                  3 => 'middle',
                  4 => 'middle',
                  5 => 'hard' }.freeze

  def initialize(test_passage)
    @user = test_passage.user
    @test_passage = test_passage
  end

  def call
    Badge.all.each do |badge|
      give_badge(badge) if !badge_has_been_issued?(badge) && send(badge.rule_name.to_s, badge.parameter)
    end
  end

  private

  def give_badge(badge)
    @user.badges.push(badge)
    @test_passage.badges.push(badge)
  end

  def all_tests_in_category(category)
    return if category != @test_passage.test.category.title

    id_tests_in_category = Test.category_tests(@test_passage.test.category).pluck(:id)
    check_for_matches(id_tests_in_category)
  end

  def pass_on_first_try(attempt)
    @user.test_passages.where('test_id = ?', @test_passage.test.id).count == attempt.to_i
  end

  def all_tests_at_level(level)
    return if level != test_level(@test_passage.test)

    tests_at_level = Test.send(level.to_s).pluck(:id)
    check_for_matches(tests_at_level)
  end

  def check_for_matches(tests_id)
    user_tests = @user.test_passages.passed.where(test_id: tests_id).distinct.pluck(:test_id).count
    user_tests == tests_id.count
  end

  def test_level(test)
    TEST_LEVELS[test.level] || 'hard'
  end

  def badge_has_been_issued?(badge)
    @user.badges.find_by(id: badge.id)
  end
end
