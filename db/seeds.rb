require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.new(first_name: "Admin", last_name: "Account", type: "Admin", password: "password", email: "default@default.com")
    

5.times do
    Ticket.new(title: Faker::Lorem.words(number: 2), description: Faker::Lorem.words(number: 8), is_open: [true, false].sample)
    Computer.new(type: ["laptop", "desktop", "mobile", "tablet"].sample, service_tag: Faker::Lorem.characters(number: 10), os: ["Windows", "MacOS", "Linux"].sample)
end