import React, { useState, useEffect, Fragment } from "react";
import ReviewsContainer from "./ReviewsContainer";

const CoffeeShopShowContainer = (props) => {
  const [coffeeShop, setCoffeeShop] = useState({reviews: []});

  let coffeeShopId = props.match.params.id;

  const fetchCoffeeShop = async () => {
    try {
      const coffeeShopResponse = await fetch(`/api/v1/coffee_shops/${coffeeShopId}`);
      if (coffeeShopResponse.ok) {
        const parsedCoffeeShopResponse = await coffeeShopResponse.json();
        return setCoffeeShop(parsedCoffeeShopResponse.coffee_shop);
      }
      const error = new Error(`${coffeeShopResponse.status}: ${coffeeShopResponse.statusText}`);
      throw error;
    } catch (error) {
      console.error(`Error in fetch: ${error.message}`);
    }
  };

  useEffect(() => {
    fetchCoffeeShop();
  }, []);

  const coffeeShopReviews = coffeeShop.reviews;

  return (
    <div>
      <h1 className="coffee-shop-name">{coffeeShop.name}</h1>
      {coffeeShop.image_url ? (
        <div className="shop-image-container">
          <img src={coffeeShop.image_url} />
        </div>
      ) : null}
      <p>{coffeeShop.address}</p>
      <p>
        {coffeeShop.city}, {coffeeShop.state} {coffeeShop.zip}
      </p>
      <p>{coffeeShop.description}</p>
      <div>
        <h2>Reviews</h2>
        <ReviewsContainer reviews={coffeeShopReviews} />
      </div>
    </div>
  );
};

export default CoffeeShopShowContainer;
