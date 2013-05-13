class SitzungController < ApplicationController

  def index

  end

  def show
    @sitzung = Sitzung.find(params[:id])
  end
end
