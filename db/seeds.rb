# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cumberland1 = CoffeeShop.find_or_create_by(name: "Cumberland Farms", address: "the corner", city: "Boston", state: "MA", zip: "02135", description: "It's a gas station extraordinaire with some delicious coffee", image_url: "https://www.sun-sentinel.com/resizer/272RrIvd4s6hAu3o_wxfph9t9H8=/415x213/top/arc-anglerfish-arc2-prod-tronc.s3.amazonaws.com/public/I6ENXUCQNZDSXJ3YIMEEVB63VE.jpg")
mirror1 = CoffeeShop.find_or_create_by(name: "Cafe Mirror", address: "the other corner", city: "Brighton", state: "MA", zip: "02135")

Review.find_or_create_by(rating: 3, comment: "It's fine but nothing to write home about.", coffee_shop: cumberland1)
Review.find_or_create_by(rating: 4, comment: "Really good for a gas station.", coffee_shop: cumberland1)