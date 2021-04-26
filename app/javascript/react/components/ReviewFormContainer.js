import React, { useState, useEffect } from "react";
import _ from "lodash";
import ErrorList from "./ErrorList";

const ReviewFormContainer = (props) => {
  const [errors, setErrors] = useState({});
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
    setErrors(submitErrors);
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

  return (
    <div>
      <form onSubmit={handleFormSubmit}>
      <h2 className="formTitle">Have you been to this coffee shop? Add your review!</h2>
        <ErrorList errors={errors} />
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
            ></input>
        </div>
        <div>
          <label>Comment</label>
            <input
              name="comment"
              id="comment"
              type="text"
              value={formFields.comment}
              onChange={handleFieldChange}
            ></input>
        </div>
        <div>
          <input type="submit" value="Submit New Review" />
        </div>
      </form>
    </div>
  );
};

export default ReviewFormContainer;
