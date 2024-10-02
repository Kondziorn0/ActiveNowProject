class AddValuesToLessons < ActiveRecord::Migration[7.2]
  def change
    add_column :lessons, :title, :string
    add_column :lessons, :description, :text
    add_column :lessons, :start_time, :datetime
    add_column :lessons, :end_time, :datetime
  end
end
