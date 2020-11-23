class EncounterMonster < ApplicationRecord
    belongs_to :monster
    belongs_to :encounter
end
