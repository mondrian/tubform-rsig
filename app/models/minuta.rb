class Minuta < ActiveRecord::Base
  has_one :operador_fechamento, :class_name => 'Funcionario', :foreign_key => 'operador_fechamento_id'
  has_one :funcionario_fechamento_financeiro, :class_name => 'Funcionario', :foreign_key => 'funcionario_fechamento_financeiro_id'
  has_one :roteiro
  has_many :itens_minutas

  validates_presence_of :data, :message => "Informe a Data da Minuta"
end

