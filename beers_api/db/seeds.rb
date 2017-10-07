# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts("Generating beers...")

5.times do |x|
  V1::Beer.create(
    name: Faker::Beer.name,
    brand: Faker::Company.name,
    price: Faker::Commerce.price,
    store: Faker::Company.suffix)
end

puts("Generating beers...[OK]")