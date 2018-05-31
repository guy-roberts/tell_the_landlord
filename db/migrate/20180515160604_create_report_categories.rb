class CreateReportCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :report_categories do |t|
      t.string :description
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
