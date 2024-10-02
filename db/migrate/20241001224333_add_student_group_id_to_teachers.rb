class AddStudentGroupIdToTeachers < ActiveRecord::Migration[7.2]
  def change
    add_reference :teachers, :student_group, foreign_key: true
  end
end
