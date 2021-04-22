import React, { Fragment } from "react";
import { useLocation } from "react-router";

const ReviewTile = (props) => {
  let coffeeRating = [];
  for (let i = 0; i < props.rating; i++) {
    coffeeRating.push(<i className="fa fa-coffee" aria-hidden="true"></i>);
  }

  return (
    <div>
      <li>
        <span>Rating: </span>
        {coffeeRating}
        <p>{props.comment}</p>
      </li>
    </div>
  );
};

export default ReviewTile;
