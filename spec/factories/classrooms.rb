FactoryBot.define do
  factory :classroom do
    name { "Classroom #{Faker::Number.unique.number(digits: 3)}" }
    description { "Description for Classroom #{Faker::Number.unique.number(digits: 3)}" }
    association :school
  end
end
