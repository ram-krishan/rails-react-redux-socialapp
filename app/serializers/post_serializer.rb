class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :display_src
  has_many :comments
end
