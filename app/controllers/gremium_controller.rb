# encoding: UTF-8
class GremiumController < ApplicationController
  def index
    @page_title       = "#{page_title} | Gremien"
    @page_description = 'Gremien Stadt Münster.'
    @page_keywords    = "#{page_keywords}, Gremium, Gremien"


    set_open_graph
    set_twitter_card

    @gremien = Gremium.all

  end

  def show
    @gremium = Gremium.find(params[:id])

    @page_title       = "#{page_title} | #{@gremium.title}"
    @page_description = 'Gremium Stadt Münster.'
    @page_keywords    = "#{page_keywords}, Gremium, #{@gremium.title}"


    set_open_graph
    set_twitter_card
    
    @notification = Notification.new
    
  end
end
