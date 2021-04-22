class Nacionalidad < ApplicationRecord
	belongs_to :pais
	has_many :medicos, dependent: :restrict_with_exception
end
