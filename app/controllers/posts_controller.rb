class PostsController < ApplicationController
  def new
    @review=Post.new
  end

  def create
    @post=Post.new(post_params)
    @post.save
  end

  def index
    @posts=Post.all

  end
  def show
    @post=Post.find(params[:id])
  end




  private

  def post_params
    params.require(:post).permit(:context,:score)
  end
end
