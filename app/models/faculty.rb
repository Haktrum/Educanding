class Faculty < ApplicationRecord
  has_many :users
  has_many :questions

  validates :name, presence: true, uniqueness: true
end
