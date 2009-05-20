class Pedido < ActiveRecord::Base
  
  belongs_to :cliente
  belongs_to :vendedor,
             :class_name => 'Funcionario',
             :foreign_key => 'vendedor_id'
  belongs_to :operador,
             :class_name => 'Funcionario',
             :foreign_key => 'operador_id'
  belongs_to :funcionario,
             :class_name => 'Funcionario',
             :foreign_key => 'funcionario_id'
  belongs_to :telemarketing,
             :class_name => 'Funcionario',
             :foreign_key => 'telemarketing_id'
  belongs_to :transportadora
  belongs_to :minuta
  belongs_to :area
  has_many   :item_pedidos
  has_many :produtos, :through => :ietm_pedidos
  
  
  validates_presence_of :tipo, :message => "Informe o Tipo de Pedido"
  validates_presence_of :data, :message => "Informe a Data do Pedido"
  validates_presence_of :cliente_id,
                        :message => "Informe o Código do Cliente"
  #validates_presence_of :valor, :message => "Pedido não foi Valorado"
  
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

end
