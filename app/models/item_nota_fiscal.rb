class ItemNotaFiscal < ActiveRecord::Base
  has_many   :produtos
  belongs_to :produto
  belongs_to :nota_fiscal

  after_save :atualiza_nota_fiscal
  after_destroy :atualiza_nota_fiscal

  def valor_total
    (self.quantidade * self.valor_item) + ((self.quantidade * self.valor_item) * self.perc_ipi / 100)
  end


  def atualiza_nota_fiscal
    self.nota_fiscal.atualiza_total_mercadoria!
    self.nota_fiscal.atualiza_total_nota!
    self.nota_fiscal.atualiza_total_icms!
  end
end
