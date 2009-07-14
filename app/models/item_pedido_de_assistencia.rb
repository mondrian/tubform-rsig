class ItemPedidoDeAssistencia < ActiveRecord::Base
   belongs_to :motivo_assistencia
   belongs_to :pedido_de_assistencia
   belongs_to :produto

  validates_presence_of :quantidade, :message => "Informe a Quantidade"
  validates_numericality_of :quantidade, :message => "Informe Apenas Números"
  validate :valida_item

   after_save :trg_soma_itens
  
  after_destroy :trg_soma_itens

  private
  def valida_item
    p = ItemPedidoDeAssistencia.find_all_by_produto_id_and_pedido_de_assistencia_id(self.produto_id, self.pedido_de_assistencia_id)
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

  # rotina para Somar os Itens e Atualizar no Pedido
  def trg_soma_itens
    self.pedido_de_assistencia.gerenciar_acoes
    self.pedido_de_assistencia.save
  end

  public 
  def sub_total
    self.quantidade * self.valor_venda
  end
end
