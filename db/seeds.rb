# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
<<<<<<< HEAD
20.times do |i|
  user = User.new(
    full_name: Faker::Name.name_with_middle,
    email: Faker::Internet.free_email,
    encrypted_password: "111111",
    phone_number: Faker::PhoneNumber.phone_number,
    # user_avatar: Faker::Avatar.image("user_avatar", "50x50"),
    username: Faker::FunnyName.name,  
  )
  user.save!(validate: false)
  puts "Created #{i + 1} users."
end
=======
>>>>>>> master
