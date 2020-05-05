FactoryBot.define do
  factory :user do
    name { Faker::StarWars.character }
    email { Faker::Email }
  end
end