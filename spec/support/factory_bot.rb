require 'factory_bot'

FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
  
  factory :coffee_shop do 
    name { "Starbucks" }
    address { "123 Fake St." }
    city { "Boston" }
    state { "MA" }
    zip { "02135" }
    description { "Best lattes in town would recommend to a friend." }
  end
end
