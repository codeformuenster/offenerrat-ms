# encoding: UTF-8
class VorlageController < ApplicationController

  def meta
    @page_title       = "#{page_title} | Vorlagen"
    @page_description = 'Aktuelle Vorlagen der Stadtverwaltung und Anträge der Parteien im Rat.'
    @page_keywords    = "#{page_keywords}, Vorlage"
    @subnav = true
    set_open_graph
    set_twitter_card

  end

  def index
    meta
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
    meta
    @page_description = 'Alle Vorlagen der Stadtverwaltung und Anträge der Parteien im Rat.'

    @vorlagen = Vorlage.all

    respond_to do |format|
      format.html
      format.rss { render :layout => false }
      format.atom
    end
  end

  def beschlossene
    meta
    @page_title       = "#{page_title} | Beschlossene Vorlagen"
    @page_description = 'Beschlossene Vorlagen der Stadtverwaltung und Anträge der Parteien im Rat.'

    @vorlagen = Vorlage.beschlossene
  end
  def in_beratung
    meta
    @page_title       = "#{page_title} | Vorlagen in Beratung"

    @vorlagen = Vorlage.in_beratung
  end

end
