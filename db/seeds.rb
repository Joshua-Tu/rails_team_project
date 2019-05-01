# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do |i|
  User.create(
    full_name: Faker::Name.name_with_middle,
    # email: Faker::Internet.email,
    phone_num: Faker::PhoneNumber.phone_number,
    # password: "111111",
    # user_avatar: Faker::Avatar.image("user_avatar", "50x50"),
    username: Faker::FunnyName.name,
    
  )
  puts "Created #{i} users."
end