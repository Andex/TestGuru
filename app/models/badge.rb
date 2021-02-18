class Badge < ApplicationRecord

  IMAGES = 'public/badges'.freeze

  RULES = [
    { name: 'За прохождение всех тестов из категории',
      method: 'all_tests_in_category',
      parameter: Category.all.pluck(:title) },
    { name: 'За прохождение теста с первой попытки',
      method: 'pass_on_first_try',
      parameter: [1] },
    { name: 'За прохождение всех тестов одного уровня',
      method: 'all_tests_at_level',
      parameter: %w[easy middle hard] }
  ].freeze

  has_and_belongs_to_many :users, dependent: :destroy
  has_and_belongs_to_many :test_passages, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :picture, :rule_name, :parameter, presence: true

  def images_names
    Dir.children(IMAGES)
  end

end
