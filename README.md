# Flow Chronic Pain Management Tool

[Production](https://flow-chronic-pain.herokuapp.com/)

## About

This is a tool for helping people manage chronic pain.

## Getting Started

This app uses standard Rails tooling.

`rake db:create`

`rails s`

Sign up

`rake user:assign_role[email_address,role] # make yourself an admin so you can manage Stages and Flows`

### Running the tests

This project uses RSpec for testing.

`bundle exec rspec`

### Coding Standards

@todo

### Deployment

This project uses Travis CI for deployment. Once a PR is merged into the Master branch it will be deployed to Heroku automatically.

## Legal and Licensing

This product and project is the property of Wyatt Andersen Consulting LLC.
