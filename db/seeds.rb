# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.destroy_all

a = Cat.create!(birth_date: "1991-10-16", color: :brown, name: "Robbie", sex: "m", description: "coolest cat")
b = Cat.create!(birth_date: "1991-05-03", color: :black, name: "Jimmy", sex: "m", description: "most studious cat")
c = Cat.create!(birth_date: "1900-01-01", color: :grey, name: "Clint", sex: "f", description: "oldest cat")



CatRentalRequest.create!(cat_id: a.id, start_date: "2015-06-18", end_date: "2015-07-15", status: "APPROVED")
CatRentalRequest.create!(cat_id: a.id, start_date: "2015-05-10", end_date: "2015-06-15", status: "APPROVED")
CatRentalRequest.create!(cat_id: b.id, start_date: "2015-03-15", end_date: "2015-04-28", status: "APPROVED")
CatRentalRequest.create!(cat_id: c.id, start_date: "2014-01-10", end_date: "2015-06-15", status: "APPROVED")
