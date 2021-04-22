require 'factory_bot'

FactoryBot.define do
  factory :user do
    username {"GuestMember123"}
    role {"member"}
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

  factory :review do
    rating { 4 }
    comment { "This is a place I went"}
  end
end
