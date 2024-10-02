class School < ApplicationRecord
  has_many :classrooms
  has_many :users
end
