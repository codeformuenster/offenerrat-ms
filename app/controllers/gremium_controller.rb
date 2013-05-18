class GremiumController < ApplicationController
  def index
    @gremien = Gremium.all
  end

  def show
    @gremium = Gremium.find(params[:id])
  end
end
