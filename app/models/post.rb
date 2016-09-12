class Post < ApplicationRecord
  attr_accessor :success
  mount_uploader :avatar, AvatarUploader
  
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy

  scope :all_except, ->(user) { where.not(user_id: user.id) }

  def is_like?(user)
    return false if user.blank?
    self.user_post_likes(user).present?
  end

  def like_post(user)
    self.likes.create(user_id: user.id)
  end

  def dislike_post(user)
    self.user_post_likes(user).destroy_all
  end

  def user_post_likes(user)
    self.likes.where(user_id: user.id)
  end

end
