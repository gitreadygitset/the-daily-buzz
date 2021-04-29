
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
coffee_shop2 = CoffeeShop.find_or_create_by(name: "Jaho Coffee Roaster & Wine Bar", address: "116 Huntington Ave", city: "Boston", state: "MA", zip: "02116", image_url: "https://345v4845f1o72rvbx12u5xsh-wpengine.netdna-ssl.com/wp-content/uploads/2016/07/0706Food_JahoPC3.jpg", user: admin1)
coffee_shop3 = CoffeeShop.find_or_create_by(name: "Caffè Dello Sport", address: "308 Hanover St", city: "Boston", state: "MA", zip: "02113", description: "Soccer-themed, cash-only espresso bar with salads, sandwiches & Italian sweets, plus an on-site ATM.", image_url: "https://infatuation.imgix.net/media/images/reviews/caffe-dello-sport/banners/1547070099.98.jpg?auto=format&fit=max&h=756&w=1572", user: admin2)
coffee_shop4 = CoffeeShop.find_or_create_by(name: "Polcari's Coffee", address: "105 Salem St", city: "Boston", state: "MA", zip: "12113", description: "Circa-1932 storied shop purveying dozens of varieties of coffee beans, nuts & Italian delicacies.", image_url: "https://polcariscoffee.com/wp-content/uploads/2020/06/polcaris-exterior.jpg", user: user1)
coffee_shop5 = CoffeeShop.find_or_create_by(name: "Cafenation", address: "Washington St", city: "Boston", state: "MA", zip: "02135", description: "Local cafe providing breakfasts, sweet & savory crêpes, sandwiches & more in minimalist surrounds.", image_url: "https://fastly.4sqi.net/img/general/200x200/19411304_wKmFL4_Bs7g7PipJlTMfF2ZxP_UUcOhgtQN4mKOy61U.jpg", user: admin4)
coffee_shop6 = CoffeeShop.find_or_create_by(name: "Kohi Coffee Company", address: "130 Guest St", city: "Boston", state: "MA", zip: "02135", description: "Single-origin & custom coffee roasts in a contemporary cafe with light breakfast & lunch fare.", image_url: "https://images.squarespace-cdn.com/content/v1/547d47aae4b087d428e4d5ff/1516303219043-VC5BOKM0BM80VBNF6ENQ/ke17ZwdGBToddI8pDm48kAt72yGFwHZjoxtmj75n0VMUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYy7Mythp_T-mtop-vrsUOmeInPi9iDjx9w8K4ZfjXt2dvp1wM0jvciobd5mvjBb-PkjbbxSYDSdt-BIyUswy_5eG6v6ULRah83RgHXAWD5lbQ/5D1_0058_2_web.jpg?format=1500w", user: admin2)
coffee_shop7 = CoffeeShop.find_or_create_by(name: "PS Gourmet Coffee", address: "106 Dorchester St", city: "Boston", state: "MA", zip: "02127", description: "Flavored brews & big cups are the signatures of this simple counter-serve coffee shop.", image_url: "https://media-cdn.tripadvisor.com/media/photo-s/09/43/dd/59/p-s-gourmet-coffee.jpg", user: admin1)
coffee_shop8 = CoffeeShop.find_or_create_by(name: "Ogawa Coffee", address: "10 Milk St", city: "Boston", state: "MA", zip: "02108", description: "The Japanese coffee chain's first international branch offers unique java flights & Asian bites.", image_url: "https://images.squarespace-cdn.com/content/v1/55248008e4b09da0b05091eb/1431885704958-EAOZ9DRYEUODFBGE8D91/ke17ZwdGBToddI8pDm48kCfe9y-SBua71cwjzsYSxDgUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8PaoYXhp6HxIwZIk7-Mi3Tsic-L2IOPH3Dwrhl-Ne3Z2PoWcwzU4FIgtbfq27IMux_T119fksCJ0CTz-joRd6HhbTvJybZOtvbWRiFosmN10/image-asset.jpeg", user: admin3)
coffee_shop9 = CoffeeShop.find_or_create_by(name: "Cuppacoffee", address: "57 Traveler St", city: "Boston", state: "MA", zip: "02118", description: "Java spot serving espresso-based drinks & pastries like hand-sized Australian meat pies.", image_url: "https://cdn.vox-cdn.com/thumbor/OcLy7M_tirSp4TqJQFT9_ID3EZw=/0x120:960x840/1400x1050/filters:focal(0x120:960x840):format(jpeg)/cdn.vox-cdn.com/uploads/chorus_image/image/47182128/11988758_533686863447647_9145676058122838990_n.0.0.jpg", user: user1)
coffee_shop10 = CoffeeShop.find_or_create_by(name: "Caffe Vittoria", address: "290-296 Hanover St", city: "Boston", state: "MA", zip: "02113", description: "Celebrated traditional Italian cafe with vintage decor, 4 floors, 3 bars & coffee.", image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Cafe_vittoria_in_boston_2013-12-27_15-56.jpg/1200px-Cafe_vittoria_in_boston_2013-12-27_15-56.jpg", user: admin2)
coffee_shop11 = CoffeeShop.find_or_create_by(name: "Ripple Cafe", address: "1906 Dorchester Ave", city: "Boston", state: "MA", zip: "02124", image_url: "https://i2.wp.com/theblackbostonian.com/wp-content/uploads/2019/03/DSC_1189-3.jpg?fit=1200%2C800&ssl=1", user: admin1)
coffee_shop12 = CoffeeShop.find_or_create_by(name: "The Well Coffee House", address: "1-1A State Street, 212 Washington St", city: "Boston", state: "MA", zip: "02109", description: "Weekday, station counter serve offering espresso drinks, smoothies & pastries in a simple setting.", image_url: "https://www.downtownboston.org/assets/Uploads/Businesses/the-well-coffee-house/_resampled/FillWyI4MDAiLCI0NTAiXQ/44316713-1892125794211990-5515553545044099072-n2.jpg", user: admin4)
coffee_shop13 = CoffeeShop.find_or_create_by(name: "Capitol Coffee House", address: "122 Bowdoin St", city: "Boston", state: "MA", zip: "02108", description: "Longtime hub with window seating serving breakfast items & sandwiches alongside coffee drinks & tea.", image_url: "https://img.geocaching.com/waymarking/display/facf6c6c-5f1d-4070-89ec-c2f2dd03aa86.jpg", user: admin3)
coffee_shop14 = CoffeeShop.find_or_create_by(name: "Tradesman Coffee Shop and Lounge", address: "58 Batterymarch St", city: "Boston", state: "MA", zip: "02110", image_url: "https://s3-media0.fl.yelpcdn.com/bphoto/Va90AoZ2jq2kVocW2iRzdA/l.jpg", user: admin3)
coffee_shop15 = CoffeeShop.find_or_create_by(name: "Phinista", address: "96 Peterborough", city: "Boston", state: "MA", zip: "02215", description: "This white-subway-tiled spot offers espresso drinks, pour-overs & teas plus sweet & savory crêpes.", image_url: "https://images.squarespace-cdn.com/content/v1/5d2cf499669038000114edd1/1607643106945-QHI5N8DVFHT7Q0DIKUDB/ke17ZwdGBToddI8pDm48kLkXF2pIyv_F2eUT9F60jBl7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0iyqMbMesKd95J-X4EagrgU9L3Sa3U8cogeb0tjXbfawd0urKshkc5MgdBeJmALQKw/untitled-5.jpg?format=2500w", user: admin3)
#3-5 reviews per coffee shop

coffee_shop_list = [
  coffee_shop1,
  coffee_shop2,
  coffee_shop3,
  coffee_shop4,
  coffee_shop5,
  coffee_shop6,
  coffee_shop7,
  coffee_shop8,
  coffee_shop9,
  coffee_shop10,
  coffee_shop11,
  coffee_shop12,
  coffee_shop13,
  coffee_shop14,
  coffee_shop15
]

coffee_shop_list.each do |shop|
  Review.find_or_create_by(rating: (rand(5) + 1) , comment: Faker::Restaurant.review, coffee_shop: shop, user: admin1)
  Review.find_or_create_by(rating: (rand(5) + 1) , comment: Faker::Restaurant.review, coffee_shop: shop, user: admin2)
  Review.find_or_create_by(rating: (rand(5) + 1) , comment: Faker::Restaurant.review, coffee_shop: shop, user: admin3)
  Review.find_or_create_by(rating: (rand(5) + 1) , comment: Faker::Restaurant.review, coffee_shop: shop, user: admin4)
end
