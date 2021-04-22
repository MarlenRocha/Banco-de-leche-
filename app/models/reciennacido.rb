class Reciennacido < ApplicationRecord
  belongs_to :enfermedad
  belongs_to :area
  belongs_to :medico
  has_many :dosificaciones, dependent: :restrict_with_exception
end
