class FileuploadsController < ApplicationController
  def index
  end

  def create
    require "json"
    @file=params[:file]
    json=@file.read
    result=JSON.parse(json)
    result.each_value do |value|
      post=Post.new(context: value)
      post.save


    end

  end

  def new
  end
end
