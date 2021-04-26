import React from "react";

const ReviewTile = (props) => {
  let coffeeRating = [];
  for (let i = 0; i < props.rating; i++) {
    coffeeRating.push(<i className="fa fa-coffee" aria-hidden="true"></i>);
  }

  return (
    <li>
      <span>Rating: </span>
      {coffeeRating}
      <p>{props.comment}</p>
    </li>
  );
};

export default ReviewTile;
