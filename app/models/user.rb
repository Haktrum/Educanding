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

  # Validates
  validates :nombre, presence: true
  validates :apellido, presence: true
  validates :faculty_id, presence: true

  # Scopes

  def username
    name = nombre + " " + apellido
    name
  end

  def points votable
    votable.joins(:votes).sum(:points)
  end

  def points_from_votes
    -votes.where('points < 0').count
  end

  def total_points
    points(questions) + points(answers) + points_from_votes
  end
end
