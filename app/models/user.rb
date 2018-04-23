class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model associations
  has_one :organisation, foreign_key: :organisation_id
  # Validations
  validates_presence_of :name, :email, :password_digest
end
