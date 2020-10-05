# README
Thank you for coming to Acclaimed Heroes.

# Versions

Ruby 2.7.1, Node lts/erbium

# Outside dependencies

https://randomuser.me

https://sandbox-api.youracclaim.com

# Local Setup

`bundle i`

`rake db:migrate`

`rake db:seed`

`bundle exec rails s`

The port is on 8081


# Deployment instructions
Autodeploy is setup on Heroku when a PR is merged into main.

Heroku has the following configuration variables that you would need to run locally too:

ACCLAIM_AUTH_TOKEN

ACCLAIM_ORG_ID

# TODO
Look at the project/issues

# App Navigation

`Home -> search`

takes you to a list of users

`Home -> Sign In -> I am an Organizer`

takes you to a page where you can issue one badge to a user at a time.

