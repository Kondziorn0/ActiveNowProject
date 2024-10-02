FactoryBot.define do
  factory :student_group do
    name { "Sample Student Group" }
    association :school
  end
end
