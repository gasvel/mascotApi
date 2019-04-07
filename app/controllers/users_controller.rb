class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

    def index
        @users = User.all
        json_response(@users)
    end
    def new
      @user = User.new
    end
    def show
      json_response(@users)
    end
    def update
      @users.update(user_params)
      head :no_content
    end
    def destroy
      @users.destroy
      head :no_content
    end

    def create
      @users= User.create!(user_params)
      json_response(@users,:created)
    end

    private

    def user_params
      params.permit(:name, :email)
    end

    def set_user
      @users= User.find(params[:id])
    end
end
