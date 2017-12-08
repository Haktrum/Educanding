class Votable < ApplicationRecord
  self.abstract_class = true
  has_many :votes, as: :votable, dependent: :destroy
  belongs_to :user

  def vote user
    votes.find_by(user: user) || Vote.new(user: user, votable: self, points: 0)
  end

  def points
    sum = votes.group(:points).count(:points)
    (sum[1] || 0) - (sum[-1] || 0)
  end
end
