class DirectorsController < ApplicationController
  
  def index
    @list_of_directors = Director.all


    render({ :template => "director_templates/index.html.erb"})
  end

  def eldest
    @eldest_director_name = Director.all.where.not({:dob => nil}).order({ :dob => :asc }).at(0).name
    eldest_director_dob_raw = Director.all.where.not({:dob => nil}).order({ :dob => :asc }).at(0).dob
    @eldest_director_dob = eldest_director_dob_raw.strftime("%B %C, %Y")
    render({ :template => "director_templates/eldest.html.erb"})
  end

  def youngest
    @youngest_director_name = Director.all.where.not({:dob => nil}).order({ :dob => :desc }).at(0).name
    youngest_director_dob_raw = Director.all.where.not({:dob => nil}).order({ :dob => :desc }).at(0).dob
    @youngest_director_dob = youngest_director_dob_raw.strftime("%B %C, %Y")
    render({ :template => "director_templates/youngest.html.erb"})
  end

  def director_details
    @director_id = params.fetch("an_id")
    @director = Director.all.where({:id => @director_id}).at(0)

    @list_of_movies_directed = Movie.all.where({:director_id => @director_id})

    render({ :template => "director_templates/show.html.erb"})
  end

end