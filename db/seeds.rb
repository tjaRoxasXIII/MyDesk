require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(first_name: "Admin", last_name: "Account", type: "SuperUser", password: "password", email: "default@default.com")
User.create(first_name: "User", last_name: "Account", type: "User", password: "password", email: "default@123.com")
    

5.times do
    Ticket.create(title: Faker::Lorem.words(number: 2), description: Faker::Lorem.words(number: 8), is_open: [true, false].sample, user_id: 2, user_admin_id: 1)
    # Computer.new(type: ["laptop", "desktop", "mobile", "tablet"].sample, service_tag: Faker::Lorem.characters(number: 10), os: ["Windows", "MacOS", "Linux"].sample)
end