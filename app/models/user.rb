class User < ApplicationRecord
  has_many :posts
  validates :username, presence: true, length: { maximum: 10 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader

  def feed
    Post.where("user_id = ?", id)
  end
end
