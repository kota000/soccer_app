class Question < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :team, presence: true

  def self.team_rank
    Question.group(:team).count.sort_by{ |_, v| -v }
  end
end
