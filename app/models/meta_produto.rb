class MetaProduto < ActiveRecord::Base
  validates_presence_of :mes, :message => "Informe o Mês da Meta"
  validates_presence_of :ano, :message => "Informe o Ano da Meta"
  validates_presence_of :qtd_dias_uteis, :message => "Informe a qtde de Dias Úteis"
  validates_presence_of :data_ini, :message => "Informe a Data Inicial"
  validates_presence_of :data_fim, :message => "Informe a Data Final"
end
