class ActorsController < ApplicationController
  
  def index
    @list_of_actors = Actor.all


    render({ :template => "actor_templates/index.html.erb"})
  end

  def actor_details
    @actor_id = params.fetch("an_id")
    @actor = Actor.all.where({:id => @actor_id}).at(0)

    @list_of_directors = Director.all
    @list_of_characters_played = Character.all.where({:actor_id => @actor_id})
    
    movie_ids = Array.new
    @list_of_characters_played.at(0..-1).each do |character|
      movie_ids.push(Movie.all.where({:id => character.movie_id}).at(0).id)
    end
    
    @list_of_movie_appearances = Movie.all.where({:id => movie_ids})

    render({ :template => "actor_templates/show.html.erb"})
  end


end