import React, { useState, useEffect, Fragment } from 'react'
import ReviewsContainer from './ReviewsContainer'

const CoffeeShopShowContainer = (props) => {
  const [coffeeShop, setCoffeeShop] = useState({
    name: "Beans",
    address: "123 Fake St.",
    city: "Boston",
    state: "MA",
    zip: "02170",
    description: "Get your beanwater here! Fresh ground beans!",
    image_url: "https://cdn10.bostonmagazine.com/wp-content/uploads/sites/2/2018/11/Jaho_Interiorccourtesy.jpg",
    reviews: [{rating: 2, comment: "This place sucks"},{rating: 5, comment: "Amazing beanwater"} ]
  })

  let coffeeShopId = props.match.params.id
  
  const fetchCoffeeShop = async() => {
    try {
      let coffeeShopResponse = await fetch(`/api/v1/coffee_shops/${coffeeShopId}`);
      debugger
      if(coffeeShopResponse.ok){
        coffeeShopResponse = await coffeeShopResponse.json()
        debugger
        return setCoffeeShop(coffeeShopResponse.coffee_shop)
      }
      let error = new Error(`${coffeeShopResponse.status}: ${coffeeShopResponse.statusText}`);
      throw error;
    } catch(error){
      console.error(`Error in fetch: ${error.message}`)
    }
  }

  useEffect(()=>{
    fetchCoffeeShop()
  }, [])

  let coffeeShopReviews = coffeeShop.reviews

  return (
    <div>
      <h1 className="coffee-shop-name">{coffeeShop.name}</h1>
      {coffeeShop.image_url ? <div className="shop-image-container"><img src={coffeeShop.image_url}/></div> : null }
      <p>{coffeeShop.address} <br/> {coffeeShop.city}, {coffeeShop.state} {coffeeShop.zip} </p>
      <p>{coffeeShop.description}</p>
        <div>
          <h2>Reviews</h2>
          <ReviewsContainer 
          reviews={coffeeShopReviews}
          />
        </div>
    </div>
  )
}

export default CoffeeShopShowContainer