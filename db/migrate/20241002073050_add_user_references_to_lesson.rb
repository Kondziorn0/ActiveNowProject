class AddUserReferencesToLesson < ActiveRecord::Migration[7.2]
  def change
    remove_reference :lessons, :student_group, index: true, foreign_key: true
    remove_reference :lessons, :teacher, index: true, foreign_key: true

    add_reference :lessons, :user, index: true, foreign_key: true
    add_reference :lessons, :student_group, index: true, foreign_key: true
  end
end
