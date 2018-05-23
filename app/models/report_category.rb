class ReportCategory < ApplicationRecord
  validates :description, presence: true, uniqueness: true
end
