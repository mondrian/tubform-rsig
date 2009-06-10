class ItemPedido < ActiveRecord::Base
  belongs_to :pedido
  belongs_to :produto

  validates_presence_of :quantidade, :message => "Informe a Quantidade"
  validates_numericality_of :quantidade, :message => "Informe Apenas Números"
  validate :valida_item
  
  #after_save :trg_soma_itens
  #after_destroy :trg_soma_itens

  private
  def valida_item
    p = ItemPedido.find_all_by_produto_id_and_pedido_id(self.produto_id, self.pedido_id)
    existe = false
    if p.size > 0
      for i in p do 
        if i.id == self.id then 
          existe = true
        end 
      end
    
     unless existe
      self.errors.add(:produto_id, 'Produto já adicionado neste pedido')
     end 
    end
  end
  
  #Trigguer para Aplicar o Desconto no Valor de Tabela
  def aplica_desconto
      desconto = self.desconto
      vlr_tabela = self.valor_tabela
      vlr_venda = (self.valor_tabela - (self.valor_tabela * self.desconto ) /100 )
      self.valor_venda = vlr_venda
  end

  # rotina para Somar os Itens e Atualizar no Pedido
  def trg_soma_itens
   self.pedido.gerenciar_acoes
   self.pedido.save
  end
  
  #Trigguer para Atualizar o percentual da comissão por Item
 def trg_comissao
   comissao = self.pedido.comissao_desconto_item
    if comissao > 0
      self.pedido.percentual_comissao = comissao
    else
      self.pedido.percentual_comissao = 5
    end
 end
 
 end
