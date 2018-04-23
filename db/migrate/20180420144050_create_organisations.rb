# db/migrate/[timestamp]_create_organisations.rb
class CreateOrganisations < ActiveRecord::Migration[5.0]
  def change
    create_table :organisations do |t|
      t.string :name

      t.timestamps
    end
  end
end

