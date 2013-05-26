class PagesController < ApplicationController
  def index
    @vorlagen = Vorlage.letzte.limit(5)
    @sitzungen_heute = Sitzung.heute
    @sitzungen_morgen = Sitzung.morgen
    @sitzungen_woche = Sitzung.kommende_nach_morgen
    @last_themen = Subject.last_month
    @next_themen = Subject.next_month
  end

  def impressum

  end
end
