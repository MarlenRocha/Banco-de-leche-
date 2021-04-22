class Especialidad < ApplicationRecord
	has_many :medicos, dependent: :restrict_with_exception
end
