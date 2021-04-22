class Donacion < ApplicationRecord
  belongs_to :donadora
  has_many :frascos, dependent: :restrict_with_exception
end
