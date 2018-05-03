class Profile < ApplicationRecord
  has_many :reports
  has_one :organisation

  alias_attribute :firstname, :first_name
  alias_attribute :lastname, :last_name

end
