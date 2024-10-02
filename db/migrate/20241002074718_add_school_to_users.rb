class AddSchoolToUsers < ActiveRecord::Migration[7.2]
  def change
    add_reference :users, :school, foreign_key: true, null: true, default: 1
  end
end
