class AddSchoolToStudentGroups < ActiveRecord::Migration[7.2]
  def change
    add_reference :student_groups, :school, foreign_key: true
  end
end
