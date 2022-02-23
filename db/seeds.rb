# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "cleaning up database"
Restaurant.destroy_all
puts "database is clean"

puts 'Creating restaurants'

5.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: Restaurant::CATEGORIES.sample,
    phone_number: Faker::PhoneNumber.cell_phone
  )
  puts 'restaurant #{restaurant.id} is created'
end

5.times do
  review = Review.create(
    rating: rand(1..5),
    content: Faker::Restaurant.review
  )
  puts 'The review for #{restaurant.id} is created'
end

puts "Done!"
