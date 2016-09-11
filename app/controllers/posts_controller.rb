class PostsController < ApplicationController
  #before_action :authenticate_user!
  
  def index
    render json: Post.all, adapter: :json, root: 'posts'
    #render json: current_user.posts, adapter: :json, root: 'posts'
  end

  def public_post
    render json: Post.all.all_except(current_user), adapter: :json, root: 'posts'
  end

  def create
    post = current_user.posts.create(post_params)

    # render json: {success: post.valid?, data: ( post.valid? ? post : post.errors.full_messages )}
    post.success = post.valid?
    if post.save
      render json: post
    else
      render json: post.errors.messages
    end
  end

  def home
  end

  private

    def post_params
      params.permit(:title, :description, :avatar)
    end
end
