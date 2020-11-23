class Encounter < ApplicationRecord
    belongs_to :user
    has_many :encounter_monsters
    has_many :monsters, through: :encounter_monsters
end
