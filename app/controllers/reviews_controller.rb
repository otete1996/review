class ReviewsController < ApplicationController
  def new
    @review=Post.new
  end
end
