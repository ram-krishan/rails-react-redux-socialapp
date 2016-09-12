class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :avatar_url, :success, :post_likes
  has_many :comments

  def avatar_url
    object.avatar.url
  end

  def post_likes
    {count: object.likes.count, is_like: object.is_like?(current_user)}
  end

end
