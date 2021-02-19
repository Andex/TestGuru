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
      give_badge(badge) if send(badge.rule_name.to_s, badge, badge.parameter)
    end
  end

  private

  def give_badge(badge)
    @user.badges.push(badge)
    @test_passage.badges.push(badge)
  end

  def all_tests_in_category(badge, category)
    begin
      return if category != @test_passage.test.category.title || @user.badges.find(badge.id)
    rescue ActiveRecord::RecordNotFound
      nil
    end
    id_tests_in_category = Test.category_tests(@test_passage.test.category).pluck(:id)
    check_for_matches(id_tests_in_category)
  end

  def pass_on_first_try(badge, attempt)
    @user.test_passages.where('test_id = ?', @test_passage.test.id).count == attempt
  end

  def all_tests_at_level(badge, level)
    begin
      return if level != test_level(@test_passage.test) || @user.badges.find(badge.id)
    rescue ActiveRecord::RecordNotFound
      nil
    end
    tests_at_level = Test.send(level.to_s).pluck(:id)
    check_for_matches(tests_at_level)
  end

  def check_for_matches(tests_id)
    user_tests = []
    tests_id.each do |test_id|
      user_tests << test_id if @user.test_passages.where('test_id = ? AND passed = ?', test_id, true)
    end
    user_tests == tests_id
  end

  def test_level(test)
    TEST_LEVELS[test.level] || 'hard'
  end
end
