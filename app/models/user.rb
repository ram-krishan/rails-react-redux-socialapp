class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable#, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :comments, foreign_key: :commenter_id
  has_many :posts
  #mount_uploader :image, AvatarUploader
end
