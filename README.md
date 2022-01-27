# Baka Home

This project make current trends opposite - baka home, smart user.  
The plan is to write app which helps maintaining pantry and more not edible stuff too.  
Something like warehouse software but for home.  
This will NOT be replacement for app like Home Assistant or Domoticz, more like nice addition to them.

## Docs TODO

* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions

## Project generation

Notes what commands were used to generate project.  
This is author's first rail project so this can be useful :)

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

# https://guides.rubyonrails.org/association_basics.html
# https://stackoverflow.com/questions/13445367/create-relationships-when-scaffolding
#ruby bin/rails generate scaffold_controller item name:string notes:text barcode:string valid_to:datetime location:references --skip-collision-check
ruby bin/rails generate scaffold_controller item name:string notes:text barcode:string valid_to:datetime location:belongs_to --skip-collision-check

ruby bin/rails generate scaffold brand name:string notes:text
ruby bin/rails db:migrate RAILS_ENV=development

ruby bin/rails generate migration AddBrandIdToItems brand_id:integer
ruby bin/rails db:migrate RAILS_ENV=development

ruby bin/rails generate scaffold_controller item name:string notes:text barcode:string valid_to:datetime location:belongs_to brand:belongs_to --skip-collision-check

# enable live updates with redis
./bin/rails turbo:install:redis

# enable tailwindcss
./bin/bundle add tailwindcss-rails
./bin/rails tailwindcss:install
```