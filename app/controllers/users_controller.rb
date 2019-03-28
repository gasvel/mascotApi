class UsersController < ApplicationController
    def index
        @users = User.all
    end
    def new
      @user = User.new
    end
    def show
        @users = User.find(params[:id])
    end

    def create
      @users= User.create(user_params)
      if @users.save
         redirect_to :action => 'index'
       end
    end
    def user_params
      params.require(:users).permit(:name, :email)
    end
end
