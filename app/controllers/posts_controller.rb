class PostsController < ApplicationController

  def index
    render json: Post.all, adapter: :json, root: 'posts'
  end

  def home
  end
end
