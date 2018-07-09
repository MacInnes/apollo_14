class Astronaut < ApplicationRecord
  has_many :spacemissionastronauts
  has_many :space_missions, through: :spacemissionastronauts

end
