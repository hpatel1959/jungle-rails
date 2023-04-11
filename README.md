# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Dependencies & Gems

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Rails/actioncable
- Rails/activestorage
- Rails/ujs
- Rails/webpacker
- Turbolinks
- Webpack
- Webpack-cli
- Rails
- PostgreSQL 9.x
- Puma
- Sass-rails
- Webpacker
- Turbolinks
- Jbuilder
- Jquery-rails
- Sdoc
- Bcrypt
- Bootstrap 5
- Font-awesome-rails
- Money-rails
- Stripe
- Rmajick
- Faker
- Carrierwave
- Bootsnap

# Dev Dependencies & Gems

- Cypress
- Webpack-dev-server
- Byebug
- Dotenv-rails
- Rspec-rails
- Net-smtp
- Cypress-rails
- Database_cleaner-active_record
- Web-console
- Rack-mini-profiler
- Listen
- Spring
- Capybara
- Selenium-webdriver
- Webdrivers
- Tzinfo-data

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## What the App Looks Like!

### Website directs to login page if user is not signed in!

!["Website directs to login page if user is not signed in!"](https://github.com/hpatel1959/jungle-rails/blob/master/docs/show-login.png?raw=true)

### Lists all products on home page once user is logged in!

!["Lists all products on home page once user is logged in!"](https://github.com/hpatel1959/jungle-rails/blob/master/docs/show-products.png?raw=true)

### Shows user items in cart once added!

!["Shows user items in cart once added!"](https://github.com/hpatel1959/jungle-rails/blob/master/docs/show-cart-with-items.png?raw=true)