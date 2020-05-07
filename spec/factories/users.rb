FactoryBot.define do
  factory :user do
    name { 'Jonny Doe' }
    email { 'name@email.com' }
    password { 'foobar' }
    password_confirmation { 'foobar' }
  end
end
