class PostsController < ApplicationController
  def new
    @review=Post.new
  end

  def create
    @post=Post.new(post_params)
    if @post.save
      redirect_to("/posts/index")
    else
      render :new
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
