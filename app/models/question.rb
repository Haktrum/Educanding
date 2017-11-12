class Question < Votable
  #Validations
  validates :title, presence: true
  validates :body, presence: true
  validates :tags, length: { minimum: 1, maximum: 5 }

  #Associations
  belongs_to :user
  belongs_to :faculty
  has_many :answers, dependent: :destroy
  has_many :question_tags, dependent: :destroy
  has_many :tags, through: :question_tags
  has_many :question_comments, dependent: :destroy
end
