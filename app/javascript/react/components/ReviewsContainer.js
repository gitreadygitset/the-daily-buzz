import React, { useState } from 'react';
import ReviewTile from './ReviewTile';

const ReviewsContainer = (props) => {
  const [voteErrors, setVoteErrors] = useState({});

  const addUserVote = async (reviewId, voteValue) => {
    try {
      const voteResponse = await fetch(`/api/v1/reviews/${reviewId}/user_votes`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Accept: 'application/json',
          credentials: 'same-origin'
        },
        body: JSON.stringify({ value: voteValue })
      });
      if (voteResponse.ok) {
        const parsedVoteResponse = await voteResponse.json();
        props.setReviews(parsedVoteResponse.reviews);
      }
    } catch (error) {
      console.error(`Error in fetch: ${error.message}`);
    }
  };

  if (props.reviews.length > 0) {
    const reviewArray = props.reviews.map(({ review }) => {
      const handleClick = () => {
        props.deleteReview(review.id);
      };

      const upVoteClick = (event) => {
        addUserVote(review.id, 1);
        event.currentTarget.style.color = '#b2ca90';
      };

      const downVoteClick = (event) => {
        addUserVote(review.id, -1);
        event.currentTarget.style.color = '#bf3310';
      };

      return (
        <ReviewTile
          key={review.id}
          review={review}
          handleClick={handleClick}
          upVoteClick={upVoteClick}
          downVoteClick={downVoteClick}
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
