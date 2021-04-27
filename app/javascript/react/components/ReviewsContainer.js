import React from "react";
import ReviewTile from "./ReviewTile";

const ReviewsContainer = (props) => {

  if (props.reviews.length > 0) {
    const reviewArray = props.reviews.map((review) => {

      const handleClick = () => {
        props.deleteReview(review.id)
      }

      return <ReviewTile 
        key={review.id} 
        id={review.id} 
        rating={review.rating} 
        comment={review.comment} 
        handleClick={handleClick} 
        currentUser={props.currentUser}
      />;

    });
    return <ul className="reviews">{reviewArray}</ul>;
  } else {
    return <p>No Reviews yet!</p>;
  }
};

export default ReviewsContainer;
