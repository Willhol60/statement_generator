# StatementGenerator

This a web app that enables customers to create income and expenditure statements. It also calculates their disposable income and provides an I&E rating.

* Ruby 3.2.2
* Rails 7.0.8
* Turbo

## Installation
    git clone git@github.com:willhol60/statement_generator.git
    cd statement_generator
    bundle
    rails db:setup
    rails s

Navigate to `http://localhost:3000/` and create an account as prompted.

## Tests
    rspec

## Future work/improvements
* More model validations and error handling
* Add tests for controller CRUD actions
* Add tests for views
* Use Hotwire to update the page without a full page reload

