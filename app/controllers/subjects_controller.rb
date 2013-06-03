class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def show
    respond_to do |format|
       format.rss { render :layout => false }
       format.html
       format.atom { @subject = Subject.find(params[:id]) }
    end
  end
end
