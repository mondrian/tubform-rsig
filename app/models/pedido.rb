class Pedido < ActiveRecord::Base
  before_create :default_func
  
  belongs_to :cliente
  belongs_to :vendedor,
             :class_name => 'Funcionario',
             :foreign_key => 'vendedor_id'
  belongs_to :operador,
             :class_name => 'Funcionario',
             :foreign_key => 'operador_id'
  belongs_to :telemarketing,
             :class_name => 'Funcionario',
             :foreign_key => 'telemarketing_id'
  belongs_to :funcionario,
             :class_name => 'Funcionario',
             :foreign_key => 'funcionario_id'
  belongs_to :transportadora
  belongs_to :minuta
  belongs_to :area
  has_many   :item_pedidos
  
  
  validates_presence_of :tipo, :message => "Informe o Tipo de Pedido"
  validates_presence_of :data, :message => "Informe a Data do Pedido"
  validates_presence_of :cliente_id,
                        :message => "Informe o Código do Cliente"
  #validates_presence_of :valor, :message => "Pedido não foi Valorado"
  validates_presence_of :funcionario_id, :message => "Informe o Funcionário"


  private
  def default_func
    self.funcionario_id = 1 
  end
  public 
  def no_prazo_medio_maximo?
    quantidade_de_parcelas = self.plano_de_pagamento.size / 3
    prazo_medio = 0
    i = 0
    while i <= self.plano_de_pagamento.size
        prazo_medio = prazo_medio + self.plano_de_pagamento[i,3].to_i
        i += 3
    end
    self.cliente.prazo_medio_maximo <= (prazo_medio / quantidade_de_parcelas)
  end

end
