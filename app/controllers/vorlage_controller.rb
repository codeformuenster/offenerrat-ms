class VorlageController < ApplicationController
  def index
    @vorlagen = Vorlage.order("datum DESC").all

    respond_to do |format|
       format.rss { render :layout => false }
       format.html
    end
  end

  def show
    @vorlage = Vorlage.find(params[:id])
  end
end
