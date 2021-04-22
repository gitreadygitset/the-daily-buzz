import React from "react";
import ReviewTile from "./ReviewTile";

const ReviewsContainer = (props) => {
  if (props.reviews.length > 0) {
    const reviewArray = props.reviews.map((review) => {
      return <ReviewTile rating={review.rating} comment={review.comment} />;
    });
    return <ul className="reviews">{reviewArray}</ul>;
  } else {
    return <p>No Reviews yet!</p>;
  }
};

export default ReviewsContainer;
