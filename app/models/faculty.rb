require 'paranoia'
class Faculty < ApplicationRecord
  acts_as_paranoid
  validates_as_paranoid
  validates_uniqueness_of_without_deleted :name

  has_many :users
  has_many :questions

  validates :name, presence: true, uniqueness:  { case_sensitive: false }

  def questions_count
    questions.count
  end
end
