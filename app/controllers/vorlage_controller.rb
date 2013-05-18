class VorlageController < ApplicationController
  def index
    @vorlagen = Vorlage.order("updated_at DESC").all
  end

  def show
    @vorlage = Vorlage.find(params[:id])
  end
end
