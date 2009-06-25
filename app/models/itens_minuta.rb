class ItensMinuta < ActiveRecord::Base

  has_one :produto
  belongs_to :minuta

  validates_presence_of :produto_id, :message => "Informe o Código do Produto"
  validates_presence_of :qtde, :message => "Informe a Quantidade"

end
