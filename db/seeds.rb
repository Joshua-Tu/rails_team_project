# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i| # This should be above User generation
  location = Location.new(
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country
  )
  location.save!
  puts "Created #{i + 1} locations."
end

10.times do |i|
  user = User.new(
    full_name: Faker::Name.name_with_middle,
    email: Faker::Internet.free_email,
    # encrypted_password: "abcde",
    password: "abcde",
    phone_number: Faker::PhoneNumber.phone_number,
    username: Faker::FunnyName.name,  
    location: Location.find(rand(1..Location.all.count))
  )
  user.save!(validate: false)
  puts "Created #{i + 1} users."
end

30.times do |i|
  item = Listing.new(
  user: User.find(rand(1..User.all.length)),
  description: Faker::Food.description,
  title: Faker::Food.dish,
  price: [5, 10, 20, 50].sample
  )
  item.save!(validate: false)
  #puts "Created #{i + 1} items."
end

150.times do |i|
  order = ProductOrder.new(
    user: User.find(rand(1..User.all.length)), # random user
    listing: Listing.find(rand(1..Listing.all.length)), # random listing
    date: Date.today
  )
  order.save!
  #puts "Created #{i + 1} orders."
end

