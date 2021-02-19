class BadgeService

  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
  end

  def call
    give_badge(Badge.first) if pass_on_first_try
  end

  def give_badge(badge)
    @user.badges.push(badge)
    @test_passage.badges.push(badge)
  end

  private

  def all_tests_in_category(category)
    # if @user.test_passages
    #
    # end
  end

  def pass_on_first_try
    @user.test_passages.where('test_id = ?', @test.id).count == 1
  end

  def all_tests_at_level(level)
  end

end
