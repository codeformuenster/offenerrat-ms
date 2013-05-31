#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |i|
  gremium = Gremium.find_or_create_by_title(title: 'Rat')
  sitzung = Sitzung.find_or_create_by_datum(datum: i.days.from_now) { |m| m.raum = "Weinhaus"; m.gremium = gremium }
  sitzung = Sitzung.find_or_create_by_datum(datum: i.days.ago) { |m| m.raum = "Weinhaus"; m.gremium = gremium }
end