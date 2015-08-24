class MoviesController < ApplicationController
  before_filter :get_movies, only: [:index]

  def index
    @people_in_movies = Movie.people_in_movies
  end

  def show
    @movie = Movie.find_by(title:params[:id])
  end


  def get_movies
    @movies = Movie.all
  end

end
