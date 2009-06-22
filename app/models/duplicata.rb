class Duplicata < ActiveRecord::Base
  belongs_to :pedido
  has_many   :contra_partidas

  def possui_lancamentos?
    self.contra_partidas.size > 0
  end

end

