#encoding: utf-8
nord = Gremium.find_or_create_by_title("Bezirksvertretung Münster-Nord")
ost = Gremium.find_or_create_by_title("Bezirksvertretung Münster-Ost")
west = Gremium.find_or_create_by_title("Bezirksvertretung Münster-West")
suedost = Gremium.find_or_create_by_title("Bezirksvertretung Münster-Südost")
hiltrup = Gremium.find_or_create_by_title("Bezirksvertretung Münster-Hiltrup")
mitte = Gremium.find_or_create_by_title("Bezirksvertretung Münster-Mitte")

["Coerde", "Kinderhaus", "Sprakel"].each do |os|
  District.find_or_create_by_name(os) { |m| m.gremium_id = nord.id }
end
["Gelmer", "Handorf"].each do |os|
  District.find_or_create_by_name(os) { |m| m.gremium_id = ost.id }
end
["Albachten", "Gievenbeck", "Mecklenbeck", "Nienberge", "Häger", "Roxel"].each do |os|
  District.find_or_create_by_name(os) { |m| m.gremium_id = west.id }
end
["Angelmodde", "Gremmendorf", "Wolbeck"].each do |os|
  District.find_or_create_by_name(os) { |m| m.gremium_id =suedost.id }
end
["Amelsbüren", "Berg Fidel", "Hiltrup"].each do |os|
  District.find_or_create_by_name(os) { |m| m.gremium_id = hiltrup.id }
end
["Mitte"].each do |os|
  District.find_or_create_by_name(os) { |m| m.gremium_id = mitte.id }
end

Party.find_or_create_by_name("SPD")
Party.find_or_create_by_name("CDU")
Party.find_or_create_by_name("FDP")
Party.find_or_create_by_name("Die Linke")
Party.find_or_create_by_name("Piratenpartei")
Party.find_or_create_by_name("UWG")
Party.find_or_create_by_name("Bündniss 90/Die Grünen/GAL")
Party.find_or_create_by_name("ÖDP")

AdminUser.create email: 'admin@example.com', password: 'password'
