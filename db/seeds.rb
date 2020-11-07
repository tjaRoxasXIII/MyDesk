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

5.times do
    @first = Faker::Name.first_name
    @last = Faker::Name.last_name
    User.create(first_name: @first, last_name: @last, type: "User", password: "password", email: "#{@first}.#{@last}@user.com")
end
    
IssueType.create(name: "Hardware Issue")
IssueType.create(name: "Software Issue")
IssueType.create(name: "Account Issue")
IssueType.create(name: "Password Reset")
IssueType.create(name: "Other")

5.times do
    Ticket.create(title: Faker::Company.buzzword, description: Faker::Company.bs, is_open: true, issue_type_id: rand(1..5), user_id: [3, 4].sample, user_admin_id: [1, 2, nil].sample)
    # Computer.new(type: ["laptop", "desktop", "mobile", "tablet"].sample, service_tag: Faker::Lorem.characters(number: 10), os: ["Windows", "MacOS", "Linux"].sample)
end

