class SitzungController < ApplicationController

  def index
    @sitzungen = Sitzung.dieser_monat
    @abgelaufende = Sitzung.letzter_monat
  end

  def show
    @sitzung = Sitzung.find(params[:id])
  end
end
