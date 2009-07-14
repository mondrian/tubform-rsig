class Regiao < ActiveRecord::Base
  has_many :pedidos

  validates_presence_of :descricao, :message => "Informe a Descrição da Região"
  validates_uniqueness_of :descricao, :message => "Região já Cadastrada"
end

