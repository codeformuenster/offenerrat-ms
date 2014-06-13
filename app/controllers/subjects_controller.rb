class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
    @vorlagen = @subject.vorlagen.paginate(page: params[:page])
    respond_to do |format|
       format.rss { render :layout => false }
       format.html
       format.atom { @subject }
    end
  end
end
