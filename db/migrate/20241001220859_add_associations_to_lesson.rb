class AddAssociationsToLesson < ActiveRecord::Migration[7.2]
  def change
    add_reference :lessons, :student_group, foreign_key: true
    add_reference :lessons, :teacher, foreign_key: true
    add_reference :lessons, :classroom, foreign_key: true
    add_reference :lessons, :subject, foreign_key: true
  end
end
