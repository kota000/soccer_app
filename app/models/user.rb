class User < ApplicationRecord
  validates :username, presence: true, length: { maximum: 10 }
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader
end
