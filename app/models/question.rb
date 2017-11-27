class Question < Votable
  #Validations
  validates :title, presence: true
  validates :body, presence: true
  validates :tags, length: { minimum: 1, maximum: 5 }

  #Associations
  belongs_to :faculty
  has_many :answers, dependent: :destroy
  has_many :question_tags, dependent: :destroy
  has_many :tags, through: :question_tags
  has_many :question_comments, dependent: :destroy

  #Scope
  scope :search, ->(query) { where('title LIKE :q OR body LIKE :q', q: "%#{query}%")}
  scope :with_faculty, ->(faculty_id) { where('faculty_id = ?', faculty_id)}
  scope :with_tag, ->(tag) { joins(:question_tags).where('question_tags.tag_id = ?', tag) }
  scope :with_answers, -> { select('questions.*').joins(:answers).group('questions.id').having('count(answers) > 0')}
  scope :without_answers, -> { select('questions.*').joins(:answers).group('questions.id').having('count(answers) = 0')}

end
