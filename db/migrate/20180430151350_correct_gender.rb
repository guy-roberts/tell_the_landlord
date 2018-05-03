class CorrectGender < ActiveRecord::Migration[5.1]
  def change
    rename_column :profiles, :gemder, :gender
  end
end
