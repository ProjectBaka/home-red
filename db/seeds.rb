# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

locations = []
brands = []
items = []

100.times do
  brands.append({name: Faker::Company.name})
end
created_brands = Brand.create(brands)

10.times do
  locations.append({name: Faker::House.room})
end
created_locations = Location.create(locations)

1500.times do
  items.append({name: Faker::Food.ingredient, valid_to: rand(100).months.from_now, barcode: rand.to_s[2..13], brand: created_brands.sample, location: created_locations.sample})
end
Item.create(items)
