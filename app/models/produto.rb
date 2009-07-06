class Produto < ActiveRecord::Base
  belongs_to :ItemNotaFiscal
  belongs_to :cor
  has_one  :classe
  has_one  :grupo
  has_one  :funcionario
  has_many :produto_kits
  has_many :notas_fiscais
  has_many :itens_nota_fiscal
  validates_presence_of :descricao, :message => "Informe a Descrição do Produto"
end

