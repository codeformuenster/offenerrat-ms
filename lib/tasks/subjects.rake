# encoding: UTF-8
namespace :subjects do
  task :create_default => :environment do
    sport = Gremium.find_by_title("Sportausschuss")
    Subject.find_or_create_by_title(title: "Sport"){|m| m.gremium = sport}
    kultur = Gremium.find_by_title("Kulturausschuss")
    Subject.find_or_create_by_title(title: "Kultur"){|m| m.gremium = kultur}
    bildung = Gremium.find_by_title("Ausschuss für Schule und Weiterbildung")
    Subject.find_or_create_by_title(title: "Bildung"){|m| m.gremium = bildung}
    familie = Gremium.find_by_title("Ausschuss für Kinder, Jugendliche und Familien")
    Subject.find_or_create_by_title(title: "Familien"){|m| m.gremium = familie}
    integration = Gremium.find_by_title("Integrationsrat")
    Subject.find_or_create_by_title(title: "Integration"){|m| m.gremium = integration}
    soziales = Gremium.find_by_title("Ausschuss für Soziales, Gesundheit und Arbeitsförderung")
    Subject.find_or_create_by_title(title: "Soziales"){|m| m.gremium = soziales}
    gleichstellung = Gremium.find_by_title("Ausschuss für Gleichstellung")
    Subject.find_or_create_by_title(title: "Gleichstellung"){|m| m.gremium = gleichstellung}
    finanzen = Gremium.find_by_title("Ausschuss für Finanzen, Beteiligungen und Liegenschaften")
    Subject.find_or_create_by_title(title: "Finanzen"){|m| m.gremium = finanzen}
    umwelt = Gremium.find_by_title("Ausschuss für Umweltschutz und Bauwesen")
    Subject.find_or_create_by_title(title: "Umwelt/Bauwesen"){|m| m.gremium = umwelt}
    planung = Gremium.find_by_title("Ausschuss für Stadtplanung, Stadtentwicklung, Verkehr und Wirtschaft")
    Subject.find_or_create_by_title(title: "Planung/Verkehr/Wirtschaft"){|m| m.gremium = planung}
    ordnung = Gremium.find_by_title("Ausschuss für Personal, Recht und Ordnung")
    Subject.find_or_create_by_title(title: "Recht/Ordnung"){|m| m.gremium = ordnung}
  end

end
