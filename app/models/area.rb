class Area < ApplicationRecord
	has_many :reciennacidos, dependent: :restrict_with_exception
	has_many :recepciones, dependent: :restrict_with_exception
	has_many :dosificaciones, dependent: :restrict_with_exception
end
