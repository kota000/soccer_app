class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments
  validates :username, presence: true, length: { maximum: 10 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader

  def self.guest
    find_or_create_by!(username: 'ゲストユーザー', email: 'guest@example.comm') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
