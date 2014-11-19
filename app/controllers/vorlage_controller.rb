# encoding: UTF-8
class VorlageController < ApplicationController

  has_scope :by_district
  has_scope :by_subject
  has_scope :by_typ
  has_scope :by_gremium

  caches_action :all
  caches_action :beschlossene
  caches_action :show

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
    @title = "Aktuelle Vorlagen"
    @filter_path = vorlagen_path
    @vorlagen = apply_scopes(Vorlage).letzter_monat.page(params[:page])

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
    @title = "Alle Vorlagen"
    @filter_path = vorlage_path(:all)
    @vorlagen = apply_scopes(Vorlage).page(params[:page])

    respond_to do |format|
      format.html { render action: :index }
      format.rss { render :layout => false, action: :index }
      format.atom { render action: :index }
    end
  end

  def beschlossene
    meta
    @page_title       = "#{page_title} | Beschlossene Vorlagen"
    @page_description = 'Beschlossene Vorlagen der Stadtverwaltung und Anträge der Parteien im Rat.'
    @title = "Beschlossene Vorlagen"
    @filter_path = vorlage_path(:beschlossene)
    @vorlagen = apply_scopes(Vorlage).beschlossene.page(params[:page])

    respond_to do |format|
      format.html { render action: :index }
      format.rss { render :layout => false, action: :index }
      format.atom { render action: :index }
    end
  end
  def in_beratung
    meta
    @page_title       = "#{page_title} | Vorlagen in Beratung"
    @title = "Vorlagen in Beratung"
    @filter_path = vorlage_path(:in_beratung)
    @vorlagen = apply_scopes(Vorlage).in_beratung.page(params[:page])
    respond_to do |format|
      format.html { render action: :index }
      format.rss { render :layout => false, action: :index }
      format.atom { render action: :index }
    end
  end

end
