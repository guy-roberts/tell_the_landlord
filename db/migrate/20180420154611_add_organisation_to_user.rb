class AddOrganisationToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :organisation_id, :integer
  end
end
