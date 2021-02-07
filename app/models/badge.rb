class Badge < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :picture, :rule_name, :parameter, presence: true

end
