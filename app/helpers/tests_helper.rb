module TestsHelper

  TEST_LEVELS = { 0 => :easy, 1 => :easy, 2 => :middle, 3 => :middle, 4 => :middle, 5 => :hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end

  def test_category(test)
    Category.all.find(test.category_id.to_s).title
  end
end
