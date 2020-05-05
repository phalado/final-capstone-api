FactoryBot.define do
  factory :fly_class do
    user_id { 1 }
    instructor_id { 1 }
    classTime { '2020-05-05' }
    status { false }
  end
end
