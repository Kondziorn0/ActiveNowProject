FactoryBot.define do
  factory :school do
    name { "School #{Faker::Number.unique.number(digits: 3)}" }
    localization { "Localization for School #{Faker::Number.unique.number(digits: 3)}" }
    description { "Description for School #{Faker::Number.unique.number(digits: 3)}" }
  end
end
