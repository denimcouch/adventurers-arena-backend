class Api::V1::UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def show_alt
        user = User.where({username: params[:username]})
        render json: user, include: {encounters: { include: {monsters: {}}}}, except: [:email, :created_at, :updated_at]
    end

    def show
        user = User.find(params[:id])
        render json: user, include: {encounters: { include: {monsters: {}}}}, except: [:email, :created_at, :updated_at]    end

    def create
        user = User.create!(user_params)
        if user.valid?
            render json: user, include: {encounters: { include: {monsters: {}}}}, except: [:email, :created_at, :updated_at]        else
            render json: {error: 'failed to create user'}, status: :not_acceptable
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
