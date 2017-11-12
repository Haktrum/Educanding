class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :votable, polymorphic: true
  validates :user_id, presence: true
  validates :votable_id, presence: true
  validates :votable_type, presence: true
  validates_inclusion_of :positive, :in => [true, false]
end
