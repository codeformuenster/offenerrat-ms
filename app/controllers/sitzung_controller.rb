class SitzungController < ApplicationController

  def index
    @sitzungen = Sitzung.dieser_monat
    @abgelaufende = Sitzung.letzter_monat
    respond_to do |format|
       format.rss { render :layout => false }
       format.html
       format.atom { @sitzungen = Sitzung.feed }
    end
  end

  def show
    @sitzung = Sitzung.find(params[:id])
  end
end
