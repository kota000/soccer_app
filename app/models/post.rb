class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 40 }

  def self.search(search)
    if search
      where(['content LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
