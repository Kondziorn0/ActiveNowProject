class StudentGroup < ApplicationRecord
  has_many :lessons
  has_many :users
  belongs_to :school
end
