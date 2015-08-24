class SearchController < ApplicationController
  def index
    @movies = params[:q] ? Movie.search(params[:q]) : []
    @people_in_movies = Movie.people_in_movies
  end
end
