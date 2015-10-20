# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.destroy_all

Cat.create!(birth_date: "1991-10-16", color: :brown, name: "Robbie", sex: "m", description: "coolest cat")
Cat.create!(birth_date: "1991-05-03", color: :black, name: "Jimmy", sex: "m", description: "most studious cat")
Cat.create!(birth_date: "1900-01-01", color: :grey, name: "Clint", sex: "f", description: "oldest cat")
