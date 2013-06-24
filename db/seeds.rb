#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ title: 'Chicago' }, { title: 'Copenhagen' }])
#   Mayor.create(title: 'Emanuel', city: cities.first)

nord = Gremium.find_by_title("Bezirksvertretung Münster-Nord")
ost = Gremium.find_by_title("Bezirksvertretung Münster-Ost")
west = Gremium.find_by_title("Bezirksvertretung Münster-West")
suedost = Gremium.find_by_title("Bezirksvertretung Münster-Südost")
hiltrup = Gremium.find_by_title("Bezirksvertretung Münster-Hiltrup")
mitte = Gremium.find_by_title("Bezirksvertretung Münster-Mitte")

["Coerde", "Kinderhaus", "Sprakel"].each do |os|
  District.find_or_create_by_name(os) { |m| m.gremium_id = nord.id }
end
["Gelmer", "Handorf"].each do |os|
  District.find_or_create_by_name(os) { |m| m.gremium_id = ost }
end
["Albachten", "Gievenbeck", "Mecklenbeck", "Nienberge", "Häger", "Roxel"].each do |os|
  District.find_or_create_by_name(os) { |m| m.gremium_id = west }
end
["Angelmodde", "Gremmendorf", "Wolbeck"].each do |os|
  District.find_or_create_by_name(os) { |m| m.gremium_id =suedost }
end
["Amelsbüren", "Berg Fidel", "Hiltrup"].each do |os|
  District.find_or_create_by_name(os) { |m| m.gremium_id = hiltrup }
end
["Mitte"].each do |os|
  District.find_or_create_by_name(os) { |m| m.gremium_id = mitte }
end
