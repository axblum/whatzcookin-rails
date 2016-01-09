# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 10.times do
#   User.create!(email: Faker::Internet.email,
#                   password: '12345678')
# end

# Populate restrictions
Restriction.create!(name: "pescetarian")
Restriction.create!(name: "lacto vegetarian")
Restriction.create!(name: "ovo vegetarian")
Restriction.create!(name: "vegan")
Restriction.create!(name: "vegetarian")

# Populate cuisine styles (a few more need to be filled below)
CuisineStyle.create!(name: "african")
CuisineStyle.create!(name: "chinese")
CuisineStyle.create!(name: "japanese")
CuisineStyle.create!(name: "korean")
CuisineStyle.create!(name: "vietnamese")
CuisineStyle.create!(name: "thai")
CuisineStyle.create!(name: "indian")
CuisineStyle.create!(name: "british")
CuisineStyle.create!(name: "irish")
CuisineStyle.create!(name: "french")
CuisineStyle.create!(name: "italian")
CuisineStyle.create!(name: "mexican")
CuisineStyle.create!(name: "spanish")
# CuisineStyle.create!(name: "spanish")
# CuisineStyle.create!(name: "spanish")
# CuisineStyles.create!(name: "spanish")
# CuisineStyles.create!(name: "spanish")
