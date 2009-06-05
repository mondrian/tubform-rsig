class ItemPedido < ActiveRecord::Base
  belongs_to :pedido
  belongs_to :produto

  validates_presence_of :quantidade, :message => "Informe a Quantidade"
  validates_numericality_of :quantidade, :message => "Informe Apenas Números"
  validate :valida_item
  
  #before_save :trg_soma_itens
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
  
  # rotina para Somar os Itens e Atualizar no Pedido
  def trg_soma_itens
   self.pedido.gerenciar_acoes
   self.pedido.save
  end

 end
