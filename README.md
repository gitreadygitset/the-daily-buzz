# The Daily Buzz

[![Codeship Status for gitreadygitset/the-daily-buzz](https://app.codeship.com/projects/677ac22f-39de-427d-869a-63c83b92ed40/status?branch=master)](https://app.codeship.com/projects/442460)

## Description

A site for coffee connoisseurs to find their new favorite caffeine fix. Rank and review the coffee shops and see what other users have contributed.

Created by:

- Tim Swierzewski
- Owen Snyder
- Nicole Smith
- Samantha Amodeo

### Technologies

The Daily Buzz was created using a Ruby on Rails backend with PostgreSQL database and React JavaScript frontend. We leveraged the Faker gem to create seed data for the website. User functionality and authentication was achieved using the Devise gem. We used CarrierWave to upload photos.

Visit [The Daily Buzz](https://thedailybuzz.herokuapp.com) on Heroku or set up locally with the directions below.

## Setup

Clone the repository from GitHub:

```
git clone https://github.com/gitreadygitset/the-daily-buzz.git
```

Change to directory and install dependencies:

```
cd the-daily-buzz
bundle install
yarn install
```

Create and set up database:

```
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

In your terminal start your server:

`bundle exec rails s`

Finally, navigate to http://localhost:3000 in your browser.

## Features

- View a list of user submitted coffee shops with the highest rated coffee shop featured at the top of the index page.
- Click on a coffee shop to view the coffee shop details, description and user submitted reviews.
- Sign up and sign in available for members to add their own coffee shops, review other coffee shops and vote on others' reviews.
- Administrators can delete user reviews and add their own coffee shops and reviews.

## TODO

- [] User can edit and delete their own reviews.

- [] Add contact information for each coffee shop

- [] Picture gallery on the individual coffee shop page

- [] Google maps integration

- [] Add coffee shop features with check off boxes (ex. outdoor dining, breakfast/lunch/dinner, good for kids, etc.)

### Contribution Guidelines

If you find issues or bugs with this application, please add an issue on GitHub. If you would like to add a feature, please create a pull request and it will be reviewed accordingly.
