require 'rails_helper'

RSpec.describe Organisation, type: :model do
  # Validation tests
  # ensure column name is present
  it { should validate_presence_of(:name) }
end
