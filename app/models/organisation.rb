class Organisation < ApplicationRecord
  has_many :users
  has_many :profiles

  validates :name, presence: true, uniqueness: true
end
