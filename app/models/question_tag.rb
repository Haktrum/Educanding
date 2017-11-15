require 'paranoia'
class QuestionTag < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :question
  belongs_to :tag
end
