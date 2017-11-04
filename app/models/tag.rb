class Tag < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness: true

  # Associations
  has_many :question_tags, dependent: :destroy
  has_many :questions, through: :question_tags
end
