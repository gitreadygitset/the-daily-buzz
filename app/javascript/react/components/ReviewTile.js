import React, { useState } from 'react';

const ReviewTile = (props) => {

  let coffeeRating = [];
  for (let i = 0; i < props.review.rating; i++) {
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
      <i class="fas fa-arrow-up" onClick={props.upVoteClick}></i>
      <span>Rating: </span>
      {coffeeRating}
      <p>{props.review.comment}</p>
      {deleteButton}
      <p>Posted by: {props.review.user?.username}</p>
      <div className="profile-pic-container">
        <img src={props.review.user?.profile_photo.url} />
      </div>
    </li>
  );
};

export default ReviewTile;
