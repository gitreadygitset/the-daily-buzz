import React, { useState, useEffect, Fragment } from 'react';
import ReviewsContainer from './ReviewsContainer';
import ReviewFormContainer from './ReviewFormContainer';

const CoffeeShopShowContainer = (props) => {
  const [coffeeShop, setCoffeeShop] = useState({});
  const [reviews, setReviews] = useState([]);
  const [currentUser, setCurrentUser] = useState({});
  const [errors, setErrors] = useState({});

  let coffeeShopId = props.match.params.id;

  const fetchCoffeeShop = async () => {
    try {
      const coffeeShopResponse = await fetch(`/api/v1/coffee_shops/${coffeeShopId}`);
      if (coffeeShopResponse.ok) {
        const parsedCoffeeShopResponse = await coffeeShopResponse.json();
        setCoffeeShop(parsedCoffeeShopResponse.coffee_shop);
        setReviews(parsedCoffeeShopResponse.reviews);
        setCurrentUser(parsedCoffeeShopResponse.current_user);
      }
      console.log(coffeeShopResponse);
    } catch (error) {
      console.error(`Error in fetch: ${error.message}`);
    }
  };

  useEffect(() => {
    fetchCoffeeShop();
  }, []);

  const addNewReview = async (formPayload) => {
    try {
      const reviewResponse = await fetch(`/api/v1/coffee_shops/${coffeeShopId}/reviews`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Accept: 'application/json'
        },
        body: JSON.stringify(formPayload)
      });
      if (reviewResponse.ok) {
        const parsedReviewResponse = await reviewResponse.json();
        setReviews([...reviews, { review: parsedReviewResponse.review }]);
      }
      if (reviewResponse.status === 401 || reviewResponse.status === 422) {
        const errorMessage = await reviewResponse.json();
        setErrors({ error: errorMessage.error });
      }
      const error = new Error(`${reviewResponse.status}: ${reviewResponse.statusText}`);
      throw error;
    } catch (error) {
      console.error(`Error in fetch: ${error.message}`);
    }
  };

  const deleteReview = async (reviewId) => {
    try {
      const deleteResponse = await fetch(`/api/v1/coffee_shops/${coffeeShopId}/reviews/${reviewId}`, {
        method: 'DELETE',
        headers: {
          'Content-Type': 'application/json',
          Accept: 'application/json'
        },
        body: JSON.stringify({ id: reviewId })
      });
      if (deleteResponse.ok) {
        const parsedDeleteResponse = await deleteResponse.json();

        if (!parsedDeleteResponse.error) {
          let remainingReviews = reviews.filter(
            (existingReview) => existingReview.review.id !== reviewId
          );
          return setReviews([...remainingReviews]);
        } else {
          return console.log(parsedDeleteResponse.error);
        }
      }
      const error = new Error(`${deleteResponse.status}: ${deleteResponse.statusText}`);
      throw error;
    } catch (error) {
      console.error(`Error in fetch: ${error.message}`);
    }
  };

  let coffeeRating = [];
  for (let i = 0; i < coffeeShop.average_rating; i++) {
    coffeeRating.push(<i className="fa fa-coffee" aria-hidden="true"></i>);
  }
  return (
    <div>
      <h1 className="coffee-shop-name">{coffeeShop.name}</h1>
      <p className="address">
        {coffeeShop.address} {coffeeShop.city}, {coffeeShop.state} {coffeeShop.zip}
      </p>
      <p className="rating"> Rating {coffeeRating} </p>

      {coffeeShop.image_url ? (
        <div className="shop-image-container">
          <img src={coffeeShop.image_url} />
        </div>
      ) : null}
      <p className="coffee-shop-description">{coffeeShop.description}</p>
      <div>
        <ReviewFormContainer
          addNewReview={addNewReview}
          setErrors={setErrors}
          errors={errors}
          currentUser={currentUser}
        />
        <ReviewsContainer
          reviews={reviews}
          deleteReview={deleteReview}
          currentUser={currentUser}
          setReviews={setReviews}
        />
      </div>
      <a href="/coffee_shops">Back to Daily Buzz Home Page</a>
    </div>
  );
};

export default CoffeeShopShowContainer;
