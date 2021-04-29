# The Daily Buzz

[![Codeship Status for gitreadygitset/the-daily-buzz](https://app.codeship.com/projects/677ac22f-39de-427d-869a-63c83b92ed40/status?branch=master)](https://app.codeship.com/projects/442460)

## Description

A site for coffee connoisseurs to find their new favorite caffeine fix. Rank and review the coffee shops and see what other users have contributed.

Created by:

- Tim Swierzewski
- Owen Snyder
- Nicole Smith
- Samantha Amodeo

Visit: https://thedailybuzz.herokuapp.com

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

## TODO

- [] User can edit and delete their own reviews.

- [] Add contact information for each coffee shop

- [] Picture gallery on the individual coffee shop page

- [] Google maps integration

- [] Add coffee shop features with check off boxes (ex. outdoor dining, breakfast/lunch/dinner, good for kids, etc.)

### Contribution Guidelines

If you find issues or bugs with this application, please add an issue on GitHub. If you would like to add a feature, please create a pull request and it will be reviewed accordingly.
