class Question < ApplicationRecord
  belongs_to :user
  belongs_to :faculty

  validates :title, presence: true
  validates :body, presence: true
end
