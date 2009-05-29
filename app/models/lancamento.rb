class Lancamento < ActiveRecord::Base
  belongs_to :duplicata
  has_many   :contra_partidas
end
