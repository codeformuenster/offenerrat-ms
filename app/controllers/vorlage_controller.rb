# encoding: UTF-8
class VorlageController < ApplicationController

  def index
    @page_title       = "#{page_title} | Vorlagen"
    @page_description = 'Aktuelle Vorlagen der Stadtverwaltung und Anträge der Parteien im Rat.'
    @page_keywords    = "#{page_keywords}, Vorlage"
    @subnav = true
    set_open_graph
    set_twitter_card

    @vorlagen = Vorlage.letzter_monat

    respond_to do |format|
      format.html
      format.rss { render :layout => false }
      format.atom
    end
  end

  def show
    @subnav = true
    @vorlage = Vorlage.find(params[:id])

    @page_title       = "#{page_title} | #{@vorlage.name}"
    @page_description = "#{@vorlage.title}"
    @page_keywords    = "#{page_keywords}, Vorlage"

    set_open_graph
    set_twitter_card

  end

  def all
    @subnav = true
    @page_title       = "#{page_title} | Vorlagen"
    @page_description = 'Alle Vorlagen der Stadtverwaltung und Anträge der Parteien im Rat.'
    @page_keywords    = "#{page_keywords}, Vorlage"

    set_open_graph
    set_twitter_card

    @vorlagen = Vorlage.all

    respond_to do |format|
      format.html
      format.rss { render :layout => false }
      format.atom
    end
  end

  def beschlossene
    @subnav = true

    @subnav = true
    @page_title       = "#{page_title} | Beschlossene Vorlagen"
    @page_description = 'Beschlossene Vorlagen der Stadtverwaltung und Anträge der Parteien im Rat.'
    @page_keywords    = "#{page_keywords}, Vorlage"

    set_open_graph
    set_twitter_card

    @vorlagen = Vorlage.beschlossene
  end

end
