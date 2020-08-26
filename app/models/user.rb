class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments
  validates :username, presence: true, length: { maximum: 10 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader
end
