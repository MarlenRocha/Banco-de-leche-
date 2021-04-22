class Donadora < ApplicationRecord
	has_many :donaciones, dependent: :restrict_with_exception
end
