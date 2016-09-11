class Post < ApplicationRecord
  attr_accessor :success
  mount_uploader :avatar, AvatarUploader
  
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :comments, :dependent => :destroy

  scope :all_except, ->(user) { where.not(user_id: user.id) }
end
