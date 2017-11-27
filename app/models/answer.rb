class Answer < Votable
  #Validations
  validates :body, presence: true

  #Associations
  belongs_to :question, counter_cache: true
  has_many :answer_comments, dependent: :destroy
end
