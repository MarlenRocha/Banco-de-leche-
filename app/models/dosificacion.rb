class Dosificacion < ApplicationRecord
  belongs_to :reciennacido
  belongs_to :area
  belongs_to :etiqueta
end
