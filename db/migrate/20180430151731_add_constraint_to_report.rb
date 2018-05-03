class AddConstraintToReport < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      ALTER TABLE reports ADD CONSTRAINT fk_reports__profile FOREIGN KEY (profile_id) references profiles(id);
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE reports DROP constraint fk_reports__profile
    SQL
  end
end
