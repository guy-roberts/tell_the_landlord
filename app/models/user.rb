class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model associations
  has_one :organisation, foreign_key: :id

  validates_uniqueness_of :name, :subdomain
  validates_presence_of :name, :email, :password_digest, :subdomain
end
