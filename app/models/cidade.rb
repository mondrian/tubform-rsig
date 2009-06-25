class Cidade < ActiveRecord::Base
  has_many :areas
  has_many :clientes

  validates_presence_of :descricao, :message => "Nome da Cidade em Branco"
end
