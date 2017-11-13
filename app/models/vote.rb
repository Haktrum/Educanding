class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :votable, polymorphic: true
  validates :user_id, presence: true
  validates :votable_id, presence: true
  validates :votable_type, presence: true
  validates_inclusion_of :points, :in => [-10, 1]

  def votable_type_id
    votable_type + '_' + votable_id.to_s
  end
end
