class VorlageController < ApplicationController
  def index
    @base_url = "https://www.stadt-muenster.de/sessionnet/sessionnetbi/"
    @vorlagen = Vorlage.order("updated_at DESC").all
  end
end
