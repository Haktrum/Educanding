require 'paranoia'
class Faculty < ApplicationRecord
  acts_as_paranoid

  has_many :users
  has_many :questions

  validates :name, presence: true, uniqueness:  { case_sensitive: false }

  scope :search, ->(query) { where('name LIKE :q', q: "%#{query}%")}
  scope :cant_order, -> { left_joins(:questions).group("faculties.id").order("count(questions.id) DESC") }

  def questions_count
    questions.count
  end
end
