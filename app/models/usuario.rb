class Usuario < ApplicationRecord
  belongs_to :tipousuario
  belongs_to :hospital
end
