class Roteiro < ActiveRecord::Base
  has_one :funcionario
  has_one :regiao
  has_many :areas

  validates_presence_of :descricao, :message => "Informe a Descrição do Roteiro"
  validates_presence_of :funcionario_id, :message => "Informe o Código do Funcionário"
  validates_presence_of :regiao_id, :message => "Informe o Código da Região"

end
