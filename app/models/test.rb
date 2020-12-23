class Test < ApplicationRecord
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :user_id

  scope :easy, -> { where(level: (0..1)) }
  scope :middle, -> { where(level: (2..4)) }
  scope :hard, -> { where(level: (5..Float::INFINITY)) }
  def self.test_names(category_title)
    joins(:category)
      .where('categories.title = :category_title', category_title: category_title)
      .order(title: :desc).pluck(:title)
  end
end
