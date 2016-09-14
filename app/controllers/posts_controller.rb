class PostsController < ApplicationController
  before_action :authenticate_user!, except: :feeds
  
  def index
    # render json: Post.all, adapter: :json, root: 'posts'
    render json: current_user.posts, adapter: :json, root: 'posts'
  end

  def public_post
    render json: Post.all.all_except(current_user), adapter: :json, root: 'posts'
  end

  def create
    post = current_user.posts.create(post_params)

    post.success = post.valid?
    if post.save
      render json: post
    else
      render json: post.errors.messages
    end
  end

  def home
    
  end

  def post_like_unlike
    post = Post.find(params[:id])
    if post.is_like?(current_user)
      post.dislike_post(current_user)
    else
      post.like_post(current_user)
    end

    render json: post
  end

  def feeds
    render json: Post.all.all_except(current_user), adapter: :json, root: 'feeds'
  end

  private

    def post_params
      params.permit(:title, :description, :avatar)
    end
end
