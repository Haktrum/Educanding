require 'paranoia'
class Tag < ApplicationRecord
  acts_as_paranoid

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  # Associations
  has_many :question_tags, dependent: :destroy
  has_many :questions, through: :question_tags

  scope :search, ->(query) { where('name LIKE :q', q: "%#{query}%")}
  scope :cant_order, -> { left_joins(:question_tags).group("tags.id").order("count(question_tags.id) DESC") }
  def questions_count
    question_tags.with_deleted.count
  end
end
