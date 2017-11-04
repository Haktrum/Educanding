class Question < ApplicationRecord
  #Validations
  validates :title, presence: true
  validates :body, presence: true

  #Associations
  belongs_to :user
  belongs_to :faculty
  has_many :answers
  has_many :question_tags, dependent: :destroy
  has_many :tags, through: :question_tags
end
