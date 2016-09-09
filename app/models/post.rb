class Post < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  
  belongs_to :user
  has_many :comments, :dependent => :destroy

  scope :all_except, ->(user) { where.not(user_id: user.id) }
end
