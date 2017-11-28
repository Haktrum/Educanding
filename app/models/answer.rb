class Answer < Votable
  #Validations
  validates :body, presence: true

  #Associations
  belongs_to :question
  has_many :answer_comments, dependent: :destroy
end
