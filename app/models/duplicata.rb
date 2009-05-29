class Duplicata < ActiveRecord::Base
  belongs_to :pedido
  has_many   :lancamentos

  def possui_lancamentos?
    self.lancamentos.size > 0
  end
end
