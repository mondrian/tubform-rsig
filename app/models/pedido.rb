class Pedido < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :vendedor, :class_name => 'Funcionario', :foreign_key => 'vendedor_id'
  belongs_to :operador, :class_name => 'Funcionario', :foreign_key => 'operador_id'
  belongs_to :funcionario, :class_name => 'Funcionario', :foreign_key => 'funcionario_id'
  belongs_to :telemarketing, :class_name => 'Funcionario', :foreign_key => 'telemarketing_id'
  belongs_to :transportadora
  belongs_to :minuta
  belongs_to :area
  has_many   :item_pedidos
  has_many   :produtos, :through => :item_pedidos

  validates_presence_of :tipo, :message => "Informe o Tipo de Pedido"
  validates_presence_of :data, :message => "Informe a Data do Pedido"
  validates_presence_of :cliente_id, :message => "Informe o Código do Cliente"
  validates_presence_of :operador_id, :message => "Operador não Informado, verifique ...."

  public
  def no_prazo_medio_maximo?
    self.cliente.prazo_medio_maximo <= self.prazo_medio
  end

  def prazo_medio
    quantidade_de_parcelas = self.plano_de_pagamento.size / 3
    prazo_medio = 0
    i = 0
    while i <= self.plano_de_pagamento.size
      prazo_medio = prazo_medio + self.plano_de_pagamento[i,3].to_i
      i += 3
    end
    prazo_medio / quantidade_de_parcelas
  end

  def no_desconto_permitido?
    faixa_de_desconto = FaixaDeDesconto.find(:first,
      :conditions => "#{self.prazo_medio} >= de and #{self.prazo_medio} <= ate")
    self.desconto < faixa_de_desconto.desconto_permitido
  end

  def aprovar
    self.entrega = Time.now
  end

  # A cada 15 dias de prazo acima do parametro, será calculada uma Unidade de Desconto na
  # comissão do Vendedor, conforme abaixo
  def desconto_comissao_prazo!
    prazo_param = 75  # Deverá vir da Tabela de Parâmetros ( param.prazo_medio )
    comissao = 0.06   # Deverá vir da Tabela de Parâmetros ( param.comissao )
    unidade = 15.000  # Deverá vir da Tabela de Parâmetros ( param.unidade )
    fator = 0.500     # Deverá vir da Tabela de Parâmetros ( param.fator )
    prazo_pedido = self.prazo_medio
    valor_comissao = 0
    if(prazo_pedido > prazo_param)
      for i in self.item_pedidos do

        # Verifica se o Vendedor "estourou" o prazo do Cliente e Aplica a Regra
        valor_total = i.valor_venda * i.quantidade
        desconto = ((prazo_pedido - prazo_param ) / unidade) * fator
        valor_base = valor_total - ( desconto * valor_total )
        valor_comissao += valor_base * comissao
      end


      # Atualiza o valor da Comissão na Tabela de Pedidos
      self.comissao_vendedor =  valor_comissao / self.valor * 100
    end
  end
end