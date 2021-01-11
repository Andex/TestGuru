module TestsHelper

  TEST_LEVELS = { 0 => :easy, 1 => :easy, 2 => :middle, 3 => :middle, 4 => :middle, 5 => :hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hard
  end

  def number_of_questions(test)
    test.questions.count
  end
end
