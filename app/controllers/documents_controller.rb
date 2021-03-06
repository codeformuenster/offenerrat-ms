# encoding: UTF-8
class DocumentsController < ApplicationController
  def index

  end

  def show
    @document = Document.find(params[:id])
    @page_title       = "#{page_title} | #{@document.title}"
    @page_description = ""
    @page_keywords    = "#{page_keywords}, Dokument"


    set_open_graph
    set_twitter_card
    
    respond_to do |format|
      format.html
      format.pdf { redirect_to @document.url }
    end
    
  end

end
