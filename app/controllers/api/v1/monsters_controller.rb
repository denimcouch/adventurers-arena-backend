class Api::V1::MonstersController < ApplicationController

    def index
        monsters = Monster.all.sort
        render json: monsters
    end

    def show
        monster = Monster.find(params[:id])
        render json: monster
    end
end
