# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do |x|
  Item.create(name: Faker::Commerce.product_name, content: Faker::Commerce.brand)
  Item.create(name: Faker::Food.ingredient, content: Faker::Food.description)
  Item.create(name: Faker::Food.dish, content: Faker::Food.description)
  Item.create(name: Faker::Food.fruits, content: Faker::Food.description)
  Item.create(name: Faker::Food.spice, content: Faker::Food.description)
  Item.create(name: Faker::Food.vegetables, content: Faker::Food.description)
end
