class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  NAME_VALID = /\A[a-zA-z]+\w*/.freeze
  EMAIL_VALID = /(\w|-)+@\w+\.\w+/.freeze

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_test, class_name: 'Test'

  validates :name, presence: true,
                   format: { with: NAME_VALID, message: 'не должно начинаться с цифры или содержать только цифры' }
  validates :email, presence: true,
                    format: { with: EMAIL_VALID, message: 'некорректен' },
                    uniqueness: true

  def test_passage_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test_id: test.id)
  end
end
