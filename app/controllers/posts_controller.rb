class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    def new
      @posts = Post.new
    end
    def show
      @posts = Post.find(params[:id])
    end
    def create
      @posts = Post.create(post_params)
      if @users.save
        redirect_to :action => 'index'
      end
    end
    def post_params
      params.require(:posts).permit(:title,:body)
    end
end
