class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Associations
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :question_comments, dependent: :destroy
  has_many :answer_comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_one :admin, dependent: :destroy

  # Validates
  validates :nombre, presence: true
  validates :apellido, presence: true
  validates :faculty_id, presence: true

  # Scopes

  def username
    name = nombre + " " + apellido
    name
  end

  def points votable, pos, neg
    sum = votable.joins(:votes).group(:points).count(:points)
    pos * (sum[1] || 0) + neg * (sum[-1] || 0)
  end

  def points_from_votes
    -votes.where('points < 0').count
  end

  def questions_votes
    points questions, 5, -2
  end

  def answers_votes
    points answers, 10, -2
  end

  def best_answers_votes
    answers.count do |a|
      a.is_best_answer?
    end * 20
  end

  def total_points
    1 + [0, questions_votes + answers_votes + best_answers_votes + points_from_votes].max
  end

  def admin?
    !admin.nil?
  end

  def skill? nombre
    permiso = Skill.find_by(nombre: nombre)
    admin? || (permiso.activo && total_points >= permiso.puntaje)
  end

  def skills
    Skill.where 'puntaje <= ?', total_points
  end

  def question_votes
    votes.where(votable_type: 'Question').order(:votable_id)
  end
end
