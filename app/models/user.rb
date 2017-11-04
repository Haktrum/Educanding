class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Associations
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy

  # Validates
  validates :nombre, presence: true
  validates :apellido, presence: true
  validates :faculty_id, presence: true

  # Scopes

end
