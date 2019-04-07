class PostsController < ApplicationController
  before_action :set_user,only: [:show,:index, :create,:update,:delete]
  before_action :set_user_post, only: [:show, :update, :destroy]

    def list
      @posts = Post.all
      json_response(@posts)
    end

    def index
        json_response(@users.posts)
    end
    def new
      @posts = Post.new
    end
    def show
      json_response(@posts)
    end
    def create
      @users.posts.create!(post_params)
      json_response(@posts, :created)
    end

    def update
      @posts.update(post_params)
      head :no_content
    end

    def destroy
      @posts.destroy
      head :no_content
    end

    private

    def post_params
      params.permit(:title,:body)
    end

    def set_user
      @users = User.find(params[:user_id])
    end
  
    def set_user_post
      @posts = @users.posts.find_by!(id: params[:id]) if @todo
    end
end
