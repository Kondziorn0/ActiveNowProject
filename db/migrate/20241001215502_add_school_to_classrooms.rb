class AddSchoolToClassrooms < ActiveRecord::Migration[7.2]
  def change
    add_reference :classrooms, :school, foreign_key: true
  end
end
