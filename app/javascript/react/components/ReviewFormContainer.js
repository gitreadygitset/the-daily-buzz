import React, { useState, useEffect } from 'react';
import _ from 'lodash';
import ErrorList from './ErrorList';

const ReviewFormContainer = (props) => {
  const [formFields, setFormFields] = useState({
    rating: '',
    comment: ''
  });

  const validForSubmission = () => {
    let submitErrors = {};
    const requiredFields = ['rating', 'comment'];
    requiredFields.forEach((field) => {
      if (formFields[field].trim() === '') {
        submitErrors = {
          ...submitErrors,
          [field]: 'is blank'
        };
      }
    });
    props.setErrors(submitErrors);
    return _.isEmpty(submitErrors);
  };

  const handleFieldChange = (event) => {
    setFormFields({
      ...formFields,
      [event.currentTarget.name]: event.currentTarget.value
    });
  };

  const handleFormSubmit = (event) => {
    event.preventDefault();
    if (validForSubmission()) {
      props.addNewReview(formFields);
      setFormFields({
        rating: '',
        comment: ''
      });
    }
  };

  const clearForm = (event) => {
    event.preventDefault();
    setFormFields({
      rating: '',
      comment: ''
    });
  };

  return (
    <div>
      <h1> New Coffee Review Form </h1>
      <form onSubmit={handleFormSubmit}>
        <ErrorList errors={props.errors} />
        <div>
          <label>
            Rating
            <input
              name="rating"
              id="rating"
              type="number"
              min={1}
              max={5}
              value={formFields.rating}
              onChange={handleFieldChange}
            />
          </label>
        </div>
        <div>
          <label>
            Comment
            <input
              name="comment"
              id="comment"
              type="text"
              value={formFields.comment}
              onChange={handleFieldChange}
            />
          </label>
        </div>
        <div>
          <input type="submit" value="Submit New Review" />
        </div>
        <div>
          <input type="button" value="Clear Form" onClick={clearForm} />
        </div>
      </form>
    </div>
  );
};

export default ReviewFormContainer;
