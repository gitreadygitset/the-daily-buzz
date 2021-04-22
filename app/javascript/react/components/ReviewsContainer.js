import React from 'react'
import ReviewTile from './ReviewTile'

const ReviewsContainer = props => {

    let reviewArray = props.reviews.map((review) => {
      return (
        <ReviewTile
          rating={review.rating}
          comment={review.comment}
        />
      )
    })

    return (
        <ul className="reviews">
            {reviewArray}
        </ul>
    )
}

export default ReviewsContainer