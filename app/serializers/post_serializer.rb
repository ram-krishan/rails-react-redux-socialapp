class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :avatar_url
  has_many :comments

  def avatar_url
    object.avatar.url
  end
end