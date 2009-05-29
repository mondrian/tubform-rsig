class ContraPartida < ActiveRecord::Base
  belongs_to :duplicata
  has_many :lancamentos
end
