class CommentsController < ApplicationController
  def create
    #for verify post exist
    Post.find(comment_param["post_id"])
    comment = current_user.comments.create(comment_param)

    render json: {success: comment.valid?, data: ( comment.valid? ? comment : comment.errors.full_messages )}
  end

  private
  
  def comment_param
    params.permit(:post_id, :comment)
  end
end
