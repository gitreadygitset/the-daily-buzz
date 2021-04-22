import React, { Fragment } from 'react'

const ReviewTile = props => {

  return (
    <li>
      <span>{props.rating}</span>
      <p>{props.comment}</p>
    </li>
  )
}

export default ReviewTile