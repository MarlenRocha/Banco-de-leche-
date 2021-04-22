class Hospital < ApplicationRecord
	belongs_to :estado
	has_many :medicos, dependent: :restrict_with_exception
	has_many :usuarios, dependent: :restrict_with_exception
end
