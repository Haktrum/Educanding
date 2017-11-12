class Votable < ApplicationRecord
  self.abstract_class = true
  has_many :votes, as: :votable, dependent: :destroy

  def vote user
    votes.find_by(user: user) || Vote.new(user: user, votable: self)
  end

  def points
    count = votes.group(:positive).count
    (count[true]  || 0) - 10 * (count[false] || 0)
  end
end
