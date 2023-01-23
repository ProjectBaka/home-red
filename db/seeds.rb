# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

locations = Location.create([{ name: "Fridge" }, { name: "Cupboard" }, { name: "Basement" }])
brands = Brand.create([{ name: "Coca-Cola" }, { name: "Nestle" }, { name: "Homemade" }])
Item.create(
  [
    { name: "Coca-Cola Zero", brand: brands.first, barcode: "5449000131836", valid_to: 1.years.from_now, location: locations.first },
    { name: "Oat Flakes", brand: brands.second, barcode: "4606272022663", valid_to: 3.years.from_now, location: locations.second },
    { name: "Pickles", brand: brands.third, valid_to: 15.years.from_now, location: locations.third },
  ]
)
