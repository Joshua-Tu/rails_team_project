# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do |i|
  user = User.new(
    full_name: Faker::Name.name_with_middle,
    email: Faker::Internet.free_email,
    # encrypted_password: "abcde",
    password: "abcde",
    phone_number: Faker::PhoneNumber.phone_number,
    # user_avatar: Faker::Avatar.image("user_avatar", "50x50"),
    username: Faker::FunnyName.name,  
  )
  user.save!(validate: false)
  puts "Created #{i + 1} users."
end

50.times do |i|
  item = Listing.new(
    # t.bigint "user_id"
  description: Faker::Food.description,
  title: Faker::Food.dish,
  price: [5, 10, 20].sample,
  created_at: Time.now,
  updated_at: Time.now
  # t.index ["user_id"], name: "index_listings_on_user_id"  
  )
  item.save!(validate: false)
  puts "Created #{i + 1} items."
end

