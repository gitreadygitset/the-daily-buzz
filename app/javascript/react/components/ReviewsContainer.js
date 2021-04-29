import React, { useState } from 'react';
import ReviewTile from './ReviewTile';

const ReviewsContainer = (props) => {
  const [userVote, setUserVote] = useState()
  const [voteErrors, setVoteErrors] = useState({})

  const addUserVote = async (reviewId, voteValue) => {
    try {
      const voteResponse = await fetch(`/api/v1/reviews/${reviewId}/user_votes`, {
        method: 'POST',
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "credentials": "same-origin"
        },
        body: JSON.stringify({review_id: reviewId, value: voteValue})
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
        debugger
        setVoteErrors({ error: errorMessage.error });
      }
      const error = new Error(`${voteResponse.status}: ${voteResponse.statusText}`);
      throw error;
    } catch (error) {
      console.error(`Error in fetch: ${error.message}`);
    }
  };

  if (props.reviews.length > 0) {
    const reviewArray = props.reviews.map((review) => {
      const handleClick = () => {
        props.deleteReview(review.id);
      };

      const upVoteClick = () => {
        addUserVote(review.id, 1);
      };

      return (
        <ReviewTile
          key={review.id}
          id={review.id}
          rating={review.rating}
          comment={review.comment}
          handleClick={handleClick}
          upVoteClick={upVoteClick}
          currentUser={props.currentUser}
        />
      );
    });
    return <ul className="reviews">{reviewArray}</ul>;
  } else {
    return <p>No Reviews yet!</p>;
  }
};

export default ReviewsContainer;
