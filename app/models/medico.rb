class Medico < ApplicationRecord
  belongs_to :especialidad
  belongs_to :hospital
  belongs_to :nacionalidad
  has_many :reciennacidos, dependent: :restrict_with_exception
end
