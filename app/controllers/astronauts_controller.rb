class AstronautsController < ApplicationController
  def index
    @astronauts = Astronaut.all
    @average_age = Astronaut.average(:age)
    @astronauts.each do |astronaut|
      astronaut.space_missions.order(:title)
    end

  end
end
