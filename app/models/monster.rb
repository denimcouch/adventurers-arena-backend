class Monster < ApplicationRecord
    has_many :encounter_monsters
    has_many :encounters, through: :encounter_monsters
end
