class MoviesController < ApplicationController
  
  def index
    @list_of_movies = Movie.all
    @list_of_directors = Director.all

    render({ :template => "movie_templates/index.html.erb"})
  end

  def movie_details
    @movie_id = params.fetch("an_id")
    @movie = Movie.all.where({:id => @movie_id}).at(0)
    
    @directed_by = Director.all.where({:id => @movie.director_id}).at(0).name

    render({ :template => "movie_templates/show.html.erb"})
  end

end