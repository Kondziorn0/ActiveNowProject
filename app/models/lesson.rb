class Lesson < ApplicationRecord
  belongs_to :student_group
  belongs_to :user
  belongs_to :classroom
  belongs_to :subject
end
