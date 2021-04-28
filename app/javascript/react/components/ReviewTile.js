import React from "react";

const ReviewTile = (props) => {
  let coffeeRating = [];
  for (let i = 0; i < props.rating; i++) {
    coffeeRating.push(<i className="fa fa-coffee" aria-hidden="true"></i>);
  }
  let deleteButton
  if (props.currentUser.role === "admin") {
    deleteButton = <button type="button" className="alert button" onClick={props.handleClick}>Delete</button>
  } else {
    deleteButton = null
  }

  return (
    <li>
      <i class="fas fa-arrow-up" onClick={props.voteClick}></i>
      <span>Rating: </span>
      {coffeeRating}
      <p>{props.comment}</p>
      {deleteButton}
    </li>
  );
};

export default ReviewTile;
