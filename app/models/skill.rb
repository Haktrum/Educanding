class Skill < ApplicationRecord
    validates :nombre, presence: true, uniqueness: true
end