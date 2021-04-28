import React, { useState, useEffect, Fragment } from 'react';
import ReviewsContainer from './ReviewsContainer';
import ReviewFormContainer from './ReviewFormContainer';

const CoffeeShopShowContainer = (props) => {
  const [coffeeShop, setCoffeeShop] = useState({});
  const [reviews, setReviews] = useState([]);
  const [currentUser, setCurrentUser] = useState({});
  const [errors, setErrors] = useState({});
  const [userVote, setUserVote] = useState(0)
  let currentUser = coffeeShop.current_user;
  let coffeeShopId = props.match.params.id;

  const fetchCoffeeShop = async () => {
    try {
      const coffeeShopResponse = await fetch(`/api/v1/coffee_shops/${coffeeShopId}`);
      if (coffeeShopResponse.ok) {
        const parsedCoffeeShopResponse = await coffeeShopResponse.json();
        const coffeeShop = ({ name, description, image_url, address, city, state, zip }) => ({
          name,
          description,
          image_url,
          address,
          city,
          state,
          zip
        });
        setCoffeeShop(coffeeShop(parsedCoffeeShopResponse.coffee_shop));
        setReviews(parsedCoffeeShopResponse.coffee_shop.reviews);
        setCurrentUser(parsedCoffeeShopResponse.coffee_shop.current_user);
      }
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

        setReviews([...coffeeShop.reviews, parsedReviewResponse.review]);
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
          let remainingReviews = coffeeShop.reviews.filter(
            (existingReview) => existingReview.id !== reviewId
          );

          return setCoffeeShop({
            ...coffeeShop,
            reviews: remainingReviews
          });
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

  const addUserVote = async (reviewId) => {
    try {
      const voteResponse = await fetch(`/api/v1/coffee_shops/${coffeecoffeeShopId}/reviews/${reviewId}/user_votes`, {
        method: 'POST',
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: JSON.stringify(reviewId)
      });
      if (voteResponse.ok) {
        const parsedVoteResponse = await voteResponse.json();
        debugger

        setUserVote({
          ...coffeeShop,
          ...reviews,
          user_votes: [...review.user_votes, userVote + 1]
        });
      }
      if (voteResponse.status === 401 || voteResponse.status === 422) {
        const errorMessage = await voteResponse.json();
        setErrors({ error: errorMessage.error });
      }
      const error = new Error(`${voteResponse.status}: ${voteResponse.statusText}`);
      throw error;
    } catch (error) {
      console.error(`Error in fetch: ${error.message}`);
    }
  };
  
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
        <ReviewFormContainer
          addNewReview={addNewReview}
          setErrors={setErrors}
          errors={errors}
          currentUser={currentUser}
        />
        <ReviewsContainer 
          reviews={coffeeShopReviews} 
          deleteReview={deleteReview} 
          currentUser={currentUser}
          addUserVote={addUserVote}
        />
      </div>
    </div>
  );
};

export default CoffeeShopShowContainer;
