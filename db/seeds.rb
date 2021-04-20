# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CoffeeShop.find_or_create_by(name: "Cumberland Farms", address: "the corner", city: "Boston", state: "MA", zip: "02135", description: "It's a gas station extraordinaire with some delicious coffee")
CoffeeShop.find_or_create_by(name: "Cafe Mirror", address: "the other corner", city: "Brighton", state: "MA", zip: "02135")
