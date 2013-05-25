class PagesController < ApplicationController
  def index
    @vorlagen = Vorlage.kommende
    @sitzungen_heute = Sitzung.heute
    @sitzungen_morgen = Sitzung.morgen
    @sitzungen_woche = Sitzung.kommende_nach_morgen
  end

  def impressum

  end
end
