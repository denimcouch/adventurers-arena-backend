class Api::V1::EncountersController < ApplicationController

    def index
        encounters = Encounter.all
        render json: encounters
    end

    def create
        byebug
        encounter = Encounter.create!(name: params[:encounter][:name], user_id: params[:user_id])
        byebug
        params[:encounter][:monsters].each do |mon_id|
            EncounterMonster.create(encounter_id: encounter.id, monster_id: mon_id)
        end
    end

    def patch
        
    end

    def delete
    end

end