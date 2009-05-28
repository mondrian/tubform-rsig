class Produto < ActiveRecord::Base
  belongs_to :ItemNotaFiscal
  has_many :prdouto_kits
  validates_presence_of :descricao, :message => "Informe a Descrição do Produto"
end
