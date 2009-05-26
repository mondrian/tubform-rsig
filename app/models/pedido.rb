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

  # Calculo de comissao por desconto do item.
  def comissao_desconto_item
    percentual_reducao = 0.150  #percentual de redução da comissão para cada 1% de desconto no item. (parametro).
    comissao_padrao = 5.00      #Percentual de comissão do vendedor por industria.
    desconto_padrao = 23.00     #Percentual de desconto maximo por item permitido.
    comissao = 0.00             #variavel local.
    vlr_comissao = 0.00         #variavel local.
    
    # Exemplodo calculo abaixo: 5.5-((25-23)*0.150)
    for item_pedido in self.item_pedidos 
        if item_pedido.desconto > 0 
            if item_pedido.desconto <= desconto_padrao
               comissao = (comissao_padrao - ((item_pedido.desconto - comissao_padrao) * percentual_reducao ))
            else
               comissao = comissao_padrao
            end        
            puts comissao
            if comissao < 0
               comissao = 0
            else
                vlr_comissao = ( ((item_pedido.valor_venda * item_pedido.quantidade) * comissao) / 100 )
            end
        else
            comissao = comissao_padrao
            vlr_comissao = ( ((item_pedido.valor_venda * item_pedido.quantidade) * comissao) / 100 )
        end
        puts vlr_comissao
    end
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
