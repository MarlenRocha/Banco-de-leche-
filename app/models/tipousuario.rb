class Tipousuario < ApplicationRecord
	has_many :usuarios, dependent: :restrict_with_exception
end
