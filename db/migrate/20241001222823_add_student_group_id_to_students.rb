class AddStudentGroupIdToStudents < ActiveRecord::Migration[7.2]
  def change
    add_reference :students, :student_group, foreign_key: true

    change_column_null :students, :student_group_id, false
  end
end
