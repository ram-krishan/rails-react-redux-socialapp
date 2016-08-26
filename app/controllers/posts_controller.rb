class PostsController < ApplicationController

  def index
    render json: Post.all, adapter: :json, root: 'posts'
  end

  def create
    post = current_user.posts.new(post_params)
    if post.save
      render json: post
    else
      render json: {errors: 'error on submit form'}
    end
  end

  def home
  end

  private

    def post_params
      params.permit(:title, :description, :avatar)
    end
end
