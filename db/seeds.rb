# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'ffaker'

users_count = 20
companies_count = 10
offers_count = 17
technologies = %w(Ruby\ on\ Rails Node.JS JavaScript C# .NET C++ Java React.js Python Django HTML CSS Haskell Skala Backbone.JS)
levels = %w(want\ to\ learn basic\ knowledge limited\ experience practical\ application applied\ theory)
roles = %w(frontend backend fullstack PM QA)
currencies = [{
                symbol: "$",
                short_name: "usd"
              },
              {
                symbol: "€",
                short_name: "eur"
              },
              {
                symbol: "zł",
                short_name: "pln"
              }]

if User.count < users_count
  puts "-- Creating users --"
  users_count.times do
    User.create(
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name,
    email: FFaker::Internet.email,
    login: rand(1) == 1 ? FFaker::Internet.user_name : nil,
    password: FFaker::Internet.password
    )
    print('.')
  end
  print("\n")
end


if Company.count < companies_count
  puts "-- Creating companies --"
  companies_count.times do
    Company.create(
    name: FFaker::Lorem.word.capitalize,
    description: FFaker::Lorem.paragraph,
    phone: FFaker::PhoneNumber.phone_number,
    address: FFaker::Address.street_address,
    nip: rand(1) == 1 ? FFaker::SSN.ssn : nil,
    krs: rand(1) == 1 ? FFaker::SSNMX.imss_undashed : nil,
    web_page: FFaker::Internet.http_url
    )
    print('.')
  end
  print("\n")
end


puts "-- Creating technologies --"
technologies.each do |technology|
  unless Technology.find_by(name: technology).present?
    Technology.create(
    name: technology,
    description: FFaker::Lorem.paragraph
    )
    print('.')
  end
end
print("\n")


puts "-- Creating levels --"
levels.each do |level|
  unless Level.find_by(name: level).present?
    Level.create(
    name: level,
    description: FFaker::Lorem.paragraph
    )
    print('.')
  end
end
print("\n")


puts "-- Creating roles --"
roles.each do |role|
  unless Role.find_by(name: role).present?
    Role.create(
    name: role,
    description: FFaker::Lorem.paragraph
    )
    print('.')
  end
end
print("\n")

puts "-- Creating currencies --"
currencies.each do |currency|
  unless Currency.find_by(symbol: currency[:symbol]).present?
    Currency.create(
    symbol: currency[:symbol],
    short_name: currency[:short_name]
    )
    print('.')
  end
end
print("\n")


if Offer.count < offers_count
  puts "-- Creating offers --"
  offers_count.times do
    salary_min = (rand(170)+ 30) * 100
    salary_max = salary_min + (rand(15) + 1) * 200
    Offer.create(
    title: FFaker::Lorem.word.capitalize,
    description: FFaker::Lorem.paragraph,
    location: FFaker::Address.street_address,
    role: Role.order("RAND()").first,
    company: Company.order("RAND()").first,
    salary_min: salary_min,
    salary_max: salary_max,
    currency: Currency.order("RAND()").first
    )
    print('.')
  end
  print("\n")
end

print("\n")


puts "-- Creating user skills --"
User.all.each do |developer|
  technologies = Technology.order("RAND()").to_a
  rand(5).times do
    developer.skills.create(
    technology: technologies.pop,
    level: Level.order("RAND()").first
    )
    print('.')
  end
end
print("\n")


puts "-- Creating skills requirements to offers --"
Offer.all.each do |offer|
  technologies = Technology.order("RAND()").to_a
  rand(4).times do
    offer.skills_requirements.create(
    technology: technologies.pop,
    level: Level.order("RAND()").first
    )
    print('.')
  end
end
print("\n")
