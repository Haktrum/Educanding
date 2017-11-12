class Answer < ApplicationRecord
  #Validations
  validates :body, presence: true

  #Associations
  belongs_to :user
  belongs_to :question
  has_many :answer_comments, dependent: :destroy
  has_many :votos, as: :votable
end
