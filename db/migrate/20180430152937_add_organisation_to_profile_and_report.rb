class AddOrganisationToProfileAndReport < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :organisation_id, :integer
    add_column :profiles, :organisation_id, :integer
    add_foreign_key :reports, :organisations
    add_foreign_key :profiles, :organisations
  end
end
