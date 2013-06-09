class DocumentsController < ApplicationController
  def index

  end

  def show
    @document = Document.find(params[:id])
  end

end
