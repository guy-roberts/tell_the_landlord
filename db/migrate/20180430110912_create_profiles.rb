class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :postcode
      t.string :email
      t.string :phone
      t.string :gemder
      t.string :notes

      t.timestamps
    end
  end
end
