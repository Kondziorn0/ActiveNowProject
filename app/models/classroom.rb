class Classroom < ApplicationRecord
  belongs_to :school
  has_and_belongs_to_many :subjects
  has_many :lessons
end
