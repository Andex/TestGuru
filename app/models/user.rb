class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  NAME_VALID = /\A[a-zA-Zа-яА-Я]+\w*/.freeze
  EMAIL_VALID = /(\w|-)+@\w+\.\w+/.freeze

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', dependent: :destroy
  has_many :gists, dependent: :destroy
  has_and_belongs_to_many :badges, dependent: :destroy

  validates :first_name, presence: true,
                         format: { with: NAME_VALID, message: I18n.t('activerecord.errors.user.messages.not_numbers') }
  validates :last_name, presence: true,
                        format: { with: NAME_VALID, message: I18n.t('activerecord.errors.user.messages.not_numbers') }
  validates :email, presence: true,
                    format: { with: EMAIL_VALID, message: I18n.t('activerecord.errors.user.messages.incorrect') },
                    uniqueness: true

  def admin?
    is_a?(Admin)
  end

  def test_passage_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test_id: test.id)
  end
end
