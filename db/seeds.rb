
admin1 = User.new(username: 'timski' ,email: 'tjswierzewski@gmail.com', password: 'password', role: "admin")
admin2 = User.new(username: 'odog',email:'snyderowen12@gmail.com', password: '123456', role: "admin")
admin3 = User.new(username: 'gitreadygitset' ,email: 'samantha.amodeo@gmail.com', password: 'password', role: "admin")
admin4 = User.new(username: 'ponyta' ,email: 'nicolesmith5724@icloud.com', password: 'password', role: "admin")
admin1.save
admin2.save
admin3.save
admin4.save
#10 - users
10.times do
  user = User.new(username: Faker::Omniauth.github[:info][:nickname], email: Faker::Omniauth.github[:info][:nickname], password: Faker::Internet.password)
  user.save
end
user1 = User.new(username: 'larrydavid', email: 'thisismail@aol.com', password: 'testing')
user1.save
#15 - coffeesshops
coffee_shop1 = CoffeeShop.find_or_create_by(name: "Cumberland Farms", address: "148 Chestnut Hill Ave", city: "Boston", state: "MA", zip: "02135", description: "Convenience store chain with packaged snacks, cold drinks, prepared foods & more (most sell fuel).", image_url: "https://www.sun-sentinel.com/resizer/272RrIvd4s6hAu3o_wxfph9t9H8=/415x213/top/arc-anglerfish-arc2-prod-tronc.s3.amazonaws.com/public/I6ENXUCQNZDSXJ3YIMEEVB63VE.jpg", user: user1)
coffee_shop2 = CoffeeShop.find_or_create_by(name: , address: , city: , state: , zip: , description: , image_url: , user: )
coffee_shop3 = CoffeeShop.find_or_create_by(name: "Caffè Dello Sport", address: "308 Hanover St", city: "Boston", state: "MA", zip: "02113", description: , image_url: , user: )
coffee_shop4 = CoffeeShop.find_or_create_by(name: , address: , city: , state: , zip: , description: , image_url: , user: )
coffee_shop5 = CoffeeShop.find_or_create_by(name: , address: , city: , state: , zip: , description: , image_url: , user: )
coffee_shop6 = CoffeeShop.find_or_create_by(name: , address: , city: , state: , zip: , description: , image_url: , user: )
coffee_shop7 = CoffeeShop.find_or_create_by(name: , address: , city: , state: , zip: , description: , image_url: , user: )
coffee_shop8 = CoffeeShop.find_or_create_by(name: , address: , city: , state: , zip: , description: , image_url: , user: )
coffee_shop9 = CoffeeShop.find_or_create_by(name: , address: , city: , state: , zip: , description: , image_url: , user: )
coffee_shop10 = CoffeeShop.find_or_create_by(name: , address: , city: , state: , zip: , description: , image_url: , user: )
coffee_shop11 = CoffeeShop.find_or_create_by(name: , address: , city: , state: , zip: , description: , image_url: , user: )
coffee_shop12 = CoffeeShop.find_or_create_by(name: , address: , city: , state: , zip: , description: , image_url: , user: )
coffee_shop13 = CoffeeShop.find_or_create_by(name: , address: , city: , state: , zip: , description: , image_url: , user: )
coffee_shop14 = CoffeeShop.find_or_create_by(name: , address: , city: , state: , zip: , description: , image_url: , user: )
coffee_shop15 = CoffeeShop.find_or_create_by(name: , address: , city: , state: , zip: , description: , image_url: , user: )
#3-5 reviews per coffee shop

cumberland1 = CoffeeShop.find_or_create_by(name: "Cumberland Farms", address: "the corner", city: "Boston", state: "MA", zip: "02135", description: "It's a gas station extraordinaire with some delicious coffee", image_url: "https://www.sun-sentinel.com/resizer/272RrIvd4s6hAu3o_wxfph9t9H8=/415x213/top/arc-anglerfish-arc2-prod-tronc.s3.amazonaws.com/public/I6ENXUCQNZDSXJ3YIMEEVB63VE.jpg", user: user1)
mirror1 = CoffeeShop.find_or_create_by(name: "Cafe Mirror", address: "the other corner", city: "Brighton", state: "MA", zip: "02135", user: user1)

Review.find_or_create_by(rating: 3, comment: "It's fine but nothing to write home about.", coffee_shop: cumberland1, user: user1)
Review.find_or_create_by(rating: 4, comment: "Really good for a gas station.", coffee_shop: cumberland1, user: user1)
