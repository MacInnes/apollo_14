class SpaceMission < ApplicationRecord
  has_many :spacemissionastronauts
  has_many :astronauts, through: :spacemissionastronauts
end
