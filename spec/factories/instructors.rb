FactoryBot.define do
  factory :instructor do
    name { 'Hiccup Horrendous Haddock III' }
    instImage { 'https://raw.githubusercontent.com/phalado/final-capstone-api/master/images/Hiccup.png' }
    dragonName { 'Toothless' }
    dragonType { 'Night Fury' }
    dragonImage { 'https://raw.githubusercontent.com/phalado/final-capstone-api/master/images/Toothless.png' }
  end
end
