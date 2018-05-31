class AddHomePhone < ActiveRecord::Migration[5.1]
  def change
    rename_column :profiles, :gender, :tenant_reference
    rename_column :profiles, :phone, :home_phone
    add_column    :profiles, :mobile_phone, :string
  end
end
