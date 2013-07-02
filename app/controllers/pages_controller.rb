# encoding: UTF-8
class PagesController < ApplicationController
  def index
    set_default_meta_tags
    set_open_graph
    set_twitter_card


    @vorlagen = Vorlage.letzte.limit(5)
    @sitzungen_heute = Sitzung.heute
    @sitzungen_morgen = Sitzung.morgen
    @sitzungen_woche = Sitzung.kommende_nach_morgen.limit(5-@sitzungen_heute.count+@sitzungen_morgen.count)
    @last_themen = Subject.last_month
    @next_themen = Subject.next_month
    @documents = Document.limit(5)
    @district_gremien = Gremium.district_gremien
  end

  def impressum
    set_default_meta_tags
    @page_title = "#{page_title} | Impressum"
    set_open_graph
    set_twitter_card

  end

  def whatsnew
    set_default_meta_tags
    @page_title = "#{page_title} | What's new"
    set_open_graph
    set_twitter_card
  end
end
