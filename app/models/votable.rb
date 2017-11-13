class Votable < ApplicationRecord
  self.abstract_class = true
  has_many :votes, as: :votable, dependent: :destroy
  belongs_to :user

  def vote user
    votes.find_by(user: user) || Vote.new(user: user, votable: self)
  end

  def points
    votes.sum(:points)
  end
end
