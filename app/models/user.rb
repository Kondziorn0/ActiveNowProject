class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lessons
  belongs_to :student_group, optional: true
  belongs_to :school

  ROLES = %w[admin teacher student].freeze

  validates :role, inclusion: { in: ROLES }

  def admin?
    role == "admin"
  end

  def teacher?
    role == "teacher"
  end

  def student?
    role == "student"
  end
end
