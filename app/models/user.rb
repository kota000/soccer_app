class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :sns_credentials, dependent: :destroy
  has_many :comments
  validates :username, presence: true, length: { maximum: 10 }
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :omniauthable,
         :omniauthable, :omniauth_providers => [:google_oauth2]
  mount_uploader :image, ImageUploader

  def self.guest
    find_or_create_by!(username: 'ゲストユーザー', email: 'guest@example.comm') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def self.without_sns_data(auth)
    user = User.where(email: auth.info.email).first

      if user.present?
        sns = SnsCredential.create(
          uid: auth.uid,
          provider: auth.provider,
          user_id: user.id
        )
      else
        user = User.new(
          username: auth.info.name,
          email: auth.info.email
        )
        sns = SnsCredential.new(
          uid: auth.uid,
          provider: auth.provider
        )
      end
      return { user: user ,sns: sns}
    end

  def self.with_sns_data(auth, snscredential)
    user = User.where(id: snscredential.user_id).first
    unless user.present?
      user = User.new(
        username: auth.info.name,
        email: auth.info.email
      )
    end
    return {user: user}
  end

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    return { user: user ,sns: sns}
  end
end
