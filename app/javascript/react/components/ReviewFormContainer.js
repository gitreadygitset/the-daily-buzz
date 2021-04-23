import React, { useState, useEffect } from "react";
import _ from "lodash";
import { Redirect } from "react-router";

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
      if (props.shouldRedirect === true) {
        return <Redirect to={`/coffee_shops/${coffeeShopId}`} />;
      }
      setFormFields({
        rating: "",
        comment: "",
      });
    }
  };

  return (
    <div>
      <h1> New Coffee Review Form </h1>
      <form onSubmit={handleFormSubmit}>
        <label>
          Rating
          <input
            name="rating"
            id="rating"
            type="text"
            value={formFields.rating}
            onChange={handleFieldChange}
          ></input>
        </label>

        <label>
          Comment
          <input
            name="comment"
            id="comment"
            type="text"
            value={formFields.comment}
            onChange={handleFieldChange}
          ></input>
        </label>

        <input type="submit" value="Submit New Review" />
      </form>
    </div>
  );
};

export default ReviewFormContainer;
