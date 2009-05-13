class Produto < ActiveRecord::Base
  belongs_to :ItemNotaFiscal

  validates_presence_of :descricao, :message => "Informe a Descrição do Produto"
end
