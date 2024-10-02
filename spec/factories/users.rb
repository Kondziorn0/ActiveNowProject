FactoryBot.define do
  factory :user do
    name { "Sample User" }
    email { "user@example.com" }
    password { "password" }
    role { "teacher" }
    association :student_group
    association :school
  end
end
