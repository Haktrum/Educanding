class Answer < ApplicationRecord
  #Validations
  validates :body, presence: true
  
  #Associations
  belongs_to :user
  belongs_to :question
end
