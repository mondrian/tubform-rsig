class ItemNotaFiscal < ActiveRecord::Base
  belongs_to :produto
  belongs_to :nota_fiscal

  validates_presence_of :quantidade, :message => "Informe a Quantidade"
  validates_presence_of :valor_item_faturado, :message => "Informe o Valor do Item Faturado"
  validates_presence_of :valor_item_original, :message => "Informe o Valor do Item Original"
  validates_presence_of :situacao_tributaria_item, :message => "Informe a Situação Tributária"
  validates_presence_of :percentual_icms_item, :message => "Informe o % do ICMS"
  validates_presence_of :percentual_ipi_item, :message => "Informe o % do IPI"
  validates_presence_of :peso_liquido, :message => "Informe o peso do Item"
  validates_presence_of :cod_emissao_nf, :message => "Informe o Código de Emissão da Nota"
end
