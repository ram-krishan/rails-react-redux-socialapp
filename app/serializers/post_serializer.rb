class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :avatar_url, :success
  has_many :comments

  def avatar_url
    object.avatar.url
  end

end
