class AddSubdomainToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :subdomain, :string
  end
end
