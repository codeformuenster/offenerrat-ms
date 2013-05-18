class SitzungController < ApplicationController

  def index
    @sitzungen = Sitzung.kommende
    @abgelaufende = Sitzung.abgelaufende
  end

  def show
    @sitzung = Sitzung.find(params[:id])
  end
end
