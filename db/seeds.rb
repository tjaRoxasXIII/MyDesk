require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(first_name: "Bill", last_name: "Gates", type: "SuperUser", password: "password", email: "bill.gates@admin.com")
User.create(first_name: "Steve", last_name: "Jobs", type: "SuperUser", password: "password", email: "steve.jobs@admin.com")

User.create(first_name: "Tom", last_name: "Haverford", type: "User", password: "password", email: "tom.haverford@user.com")
User.create(first_name: "Johnny", last_name: "Karate", type: "User", password: "password", email: "johnny.karate@user.com")
    
IssueType.create(name: "Hardware Issue")
IssueType.create(name: "Software Issue")
IssueType.create(name: "Account Issue")
IssueType.create(name: "Password Reset")
IssueType.create(name: "Other")

5.times do
    Ticket.create(title: Faker::Lorem.words(number: 2), description: Faker::Lorem.words(number: 8), is_open: [true, false].sample, issue_type_id: rand(1..5), user_id: [3, 4].sample, user_admin_id: [1, 2].sample)
    # Computer.new(type: ["laptop", "desktop", "mobile", "tablet"].sample, service_tag: Faker::Lorem.characters(number: 10), os: ["Windows", "MacOS", "Linux"].sample)
end

