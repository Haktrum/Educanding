class Skill < ApplicationRecord
    validates :nombre, presence: true, uniqueness: true
    validates :puntaje, presence: true

    def is name
      nombre == name
    end
end
