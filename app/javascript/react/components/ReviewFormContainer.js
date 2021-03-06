import React, { useState } from "react";
import _ from "lodash";
import ErrorList from "./ErrorList";

const ReviewFormContainer = (props) => {
  const [formFields, setFormFields] = useState({
    rating: "",
    comment: "",
  });

  const validForSubmission = () => {
    let submitErrors = {};
    const requiredFields = ["rating", "comment"];
    requiredFields.forEach((field) => {
      if (formFields[field].trim() === "") {
        submitErrors = {
          ...submitErrors,
          [field]: "is blank",
        };
      }
    });
    props.setErrors(submitErrors);
    return _.isEmpty(submitErrors);
  };

  const handleFieldChange = (event) => {
    setFormFields({
      ...formFields,
      [event.currentTarget.name]: event.currentTarget.value,
    });
  };

  const handleFormSubmit = (event) => {
    event.preventDefault();
    if (validForSubmission()) {
      props.addNewReview(formFields);
      setFormFields({
        rating: "",
        comment: "",
      });
    }
  };

  const clearForm = (event) => {
    event.preventDefault();
    setFormFields({
      rating: "",
      comment: "",
    });
  };
  if (_.isEmpty(props.currentUser)) {
    return (
      <div>
        <h4>Please sign in to leave a review</h4>
      </div>
    );
  }
  return (
    <div>
      <form onSubmit={handleFormSubmit}>
        <ErrorList errors={props.errors} />
        <h2>Add A Review</h2>
        <div>
          <label>Rating</label>
          <input
            name="rating"
            id="rating"
            type="number"
            min={1}
            max={5}
            value={formFields.rating}
            onChange={handleFieldChange}
          />
        </div>
        <div>
          <label>Comment</label>
          <input
            name="comment"
            id="comment"
            type="text"
            value={formFields.comment}
            onChange={handleFieldChange}
          />
        </div>
        <div>
          <input type="submit" value="Submit New Review" />
        </div>
        <div>
          <input className="alert button" type="button" value="Clear Form" onClick={clearForm} />
        </div>
      </form>
    </div>
  );
};

export default ReviewFormContainer;
