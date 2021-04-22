class Enfermedad < ApplicationRecord
	has_many :reciennacidos, dependent: :restrict_with_exception
	
end
