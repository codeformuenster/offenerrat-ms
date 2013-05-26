class VorlageController < ApplicationController
  def index
    @vorlagen = Vorlage.order("datum DESC").all
  end

  def show
    @vorlage = Vorlage.find(params[:id])
  end
end
