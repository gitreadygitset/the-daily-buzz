user1 = User.new(username: 'larrydavid', email: 'thisismail@aol.com', password: 'testing')
user1.save

cumberland1 = CoffeeShop.find_or_create_by(name: "Cumberland Farms", address: "the corner", city: "Boston", state: "MA", zip: "02135", description: "It's a gas station extraordinaire with some delicious coffee", image_url: "https://www.sun-sentinel.com/resizer/272RrIvd4s6hAu3o_wxfph9t9H8=/415x213/top/arc-anglerfish-arc2-prod-tronc.s3.amazonaws.com/public/I6ENXUCQNZDSXJ3YIMEEVB63VE.jpg", user: user1)
mirror1 = CoffeeShop.find_or_create_by(name: "Cafe Mirror", address: "the other corner", city: "Brighton", state: "MA", zip: "02135", user: user1)

Review.find_or_create_by(rating: 3, comment: "It's fine but nothing to write home about.", coffee_shop: cumberland1)
Review.find_or_create_by(rating: 4, comment: "Really good for a gas station.", coffee_shop: cumberland1)
