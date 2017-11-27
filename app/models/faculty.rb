require 'paranoia'
class Faculty < ApplicationRecord
  acts_as_paranoid

  has_many :users
  has_many :questions

  validates :name, presence: true, uniqueness:  { case_sensitive: false }

  def questions_count
    questions.count
  end
end
