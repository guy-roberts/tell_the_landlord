class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :category
      t.string :description
      t.float :latitude
      t.float :longitude
      t.integer :profile_id

      t.timestamps
    end
  end
end
