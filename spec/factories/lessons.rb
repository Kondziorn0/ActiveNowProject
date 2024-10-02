FactoryBot.define do
  factory :lesson do
    title { "Sample Lesson Title" }
    description { "This is a description of the lesson." }
    start_time { Time.zone.now }
    end_time { Time.zone.now + 1.hour }
    association :student_group
    association :user
    association :classroom
    association :subject
  end
end
