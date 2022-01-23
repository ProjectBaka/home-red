# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Project generation
```bash
# one time
sudo apt-get install libsqlite3-dev
rails new baka-home --skip

ruby bin/rails generate scaffold item name:string notes:text barcode:string valid_to:datetime
ruby bin/rails db:migrate RAILS_ENV=development

ruby bin/rails generate scaffold location name:string notes:text
ruby bin/rails db:migrate RAILS_ENV=development

ruby bin/rails generate migration AddLocationIdToItems location_id:integer
ruby bin/rails db:migrate RAILS_ENV=development
```