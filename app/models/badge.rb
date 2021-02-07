class Badge < ApplicationRecord

  has_and_belongs_to_many :users, dependent: :destroy
  has_and_belongs_to_many :test_passages, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :picture, :rule_name, :parameter, presence: true

end
