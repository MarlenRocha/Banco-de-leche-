class Clasificacion < ApplicationRecord
	has_many :analisisregistros, dependent: :restrict_with_exception
end
