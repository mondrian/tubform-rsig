class Funcionario < ActiveRecord::Base
  has_many :notasfiscais
  belongs_to :cidade

  validates_presence_of :tipo, :message => "Informe o Tipo do Funcionário"
  validates_presence_of :nome, :message => "Informe o Nome do Funcionário"
  validates_presence_of :endereco, :message => "Informe Endereço do Funcionário"
  validates_uniqueness_of :cpf, :message => "Já existe um Funcionário com esse CPF"
  validates_uniqueness_of :rg,  :message => "Já existe um Funcionário com esse RG"
end
