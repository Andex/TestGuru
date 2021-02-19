class BadgeService

  def initialize(test_passage)
    @user = test_passage.user
    @test_passage = test_passage
  end

  def call
    Badge.all.each do |badge|
      give_badge(badge) if send(badge.rule_name.to_s, badge, badge.parameter)
    end
  end

  def give_badge(badge)
    @user.badges.push(badge)
    @test_passage.badges.push(badge)
  end

  private

  def all_tests_in_category(badge, category)
    return if category != @test_passage.test.category.title || @user.badges.find(badge.id)

    id_tests_in_category = Test.category_tests(@test_passage.test.category).pluck(:id)
    id_tests_user_in_category = []
    id_tests_in_category.each do |test_id|
      id_tests_user_in_category << test_id if @user.test_passages.where('test_id = ? AND passed = ?', test_id, true)
    end
    id_tests_user_in_category == id_tests_in_category
  end

  def pass_on_first_try(badge, attempt)
    @user.test_passages.where('test_id = ?', @test_passage.test.id).count == attempt
  end

  def all_tests_at_level(badge, level)
    # level = badge.parameter

  end

end
