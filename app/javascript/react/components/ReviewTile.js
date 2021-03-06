import React from 'react';

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
    <li className="review-tile">
      
      <span>Rating: </span>
      {coffeeRating}
      <p>{props.review.comment}</p>
      <div className="by-line">
        <div>
          <div className="profile-pic-container">
            <img src={props.review.user?.profile_photo.url} />
          </div>
          <span className="posted-user">Posted by: {props.review.user?.username}</span>
        </div>
        <div className="score">
          <i className="fas fa-arrow-up" onClick={props.upVoteClick}></i>
          <i className="fas fa-arrow-down" onClick={props.downVoteClick}></i>
          <span>Score: {props.review.score}</span>
        </div>
      </div>
      {deleteButton}
    </li>
  );
};

export default ReviewTile;
