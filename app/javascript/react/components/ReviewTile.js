import React from 'react';

const ReviewTile = (props) => {
  let coffeeRating = [];
  for (let i = 0; i < props.rating; i++) {
    coffeeRating.push(<i className="fa fa-coffee" aria-hidden="true"></i>);
  }
  let deleteButton = null;
  if (props.currentUser?.role === 'admin') {
    deleteButton = (
      <button type="button" className="alert button" onClick={props.handleClick}>
        Delete
      </button>
    );
  }

  return (
    <li>
      <span>Rating: </span>
      {coffeeRating}
      <p>{props.comment}</p>
      {deleteButton}
    </li>
  );
};

export default ReviewTile;
