module TestsHelper

  TEST_LEVELS = { 0 => I18n.t('.helpers.test_levels.easy'),
                  1 => I18n.t('.helpers.test_levels.easy'),
                  2 => I18n.t('.helpers.test_levels.middle'),
                  3 => I18n.t('.helpers.test_levels.middle'),
                  4 => I18n.t('.helpers.test_levels.middle'),
                  5 => I18n.t('.helpers.test_levels.hard') }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || t('.helpers.test_levels.hard')
  end

  def number_of_questions(test)
    test.questions.count
  end
end
