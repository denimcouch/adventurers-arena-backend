class Api::V1::EncountersController < ApplicationController

    def index
        encounters = Encounter.all
        render json: encounters
    end

    def show
        encounter = Encounter.find(params[:id])
        render json: encounter, include: {monsters: {}}
    end

    def create
        encounter = Encounter.create!(name: params[:encounter][:name], user_id: params[:user_id])
        params[:encounter][:monsters].each do |mon_id|
            EncounterMonster.create(encounter_id: encounter.id, monster_id: mon_id)
        end
        user = User.find(params[:user_id])
        render json: user, include: {encounters: { include: {monsters: {}}}}, except: [:email, :created_at, :updated_at]
    end

    def patch
        
    end

    def destroy
        # byebug
        encounter = Encounter.find(params[:id])
        user = User.find(encounter.user_id)
        # byebug
        encounter_monsters = EncounterMonster.all.select{ |en_mon| en_mon.encounter_id == encounter.id}
        encounter_monsters.map{|en_mon| en_mon.destroy}
        encounter.destroy
        render json: user, include: {encounters: { include: {monsters: {}}}}, except: [:email, :created_at, :updated_at]
    end

end