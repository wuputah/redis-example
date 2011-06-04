# Running on Bamboo

    heroku create --stack bamboo-mri-1.9.2
    git push heroku master

# Running on Cedar

    heroku create --stack cedar
    git push heroku master

# Running locally

    foreman start

# Project history

1. Set up Gemfile. Add `redis`, `redis-store`. For production,
   include `pg`. Add `thin` for running on Cedar.
