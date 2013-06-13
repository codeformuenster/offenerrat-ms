# encoding: UTF-8
class SitzungController < ApplicationController

  def index
    @page_title       = "#{page_title} | Sitzungen"
    @page_description = 'Aktuelle Sitzungen der Gremien Stadt Münster.'
    @page_keywords    = "#{page_keywords}, Sitzung"

    set_open_graph
    set_twitter_card
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

    @page_title       = "#{page_title} | #{@sitzung.formatted_datum} #{@sitzung.gremium.title}"
    @page_description = "Sitzung #{@sitzung.gremium.title} #{@sitzung.formatted_datum}."
    @page_keywords    = "#{page_keywords}, Sitzung, #{@sitzung.gremium.title}"


    set_open_graph
    set_twitter_card


  end
end
