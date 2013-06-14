class SearchController < ApplicationController
  def index
    @global_query = params[:global_query]
    @results = PgSearch::Document.wildcard_search(@global_query)
  end
end
