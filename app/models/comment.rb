class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, optional: true
  validates :content, presence: true, length: { maximum: 100 }
end
