class AnswerComment < ApplicationRecord
  belongs_to :answer
  belongs_to :user

  validates :body, presence: true
end
