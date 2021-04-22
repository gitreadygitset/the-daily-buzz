import React, { Fragment } from 'react'
import { useLocation } from 'react-router'

const ReviewTile = props => {
  let coffeeRating = [];
  for(let i=0; i < props.rating; i++){
    coffeeRating.push(<i class="fa fa-coffee" aria-hidden="true"></i>)
  }
  
  return (
    <li>
      <span>Rating: </span>
      {coffeeRating}
      <p>{props.comment}</p>
      <p className="user-review-post">Posted By: GuestUser123 </p>
    </li>
  )
}

export default ReviewTile