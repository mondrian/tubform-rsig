class ItemPedidoDeAssistencia < ActiveRecord::Base
   belongs_to :motivo_assistencia
   belongs_to :pedido_de_assistencia
   belongs_to :produto

  validates_presence_of :quantidade, :message => "Informe a Quantidade"
  validates_numericality_of :quantidade, :message => "Informe Apenas Números"
  validates_presence_of :valor_venda, :message => "Informe o Valor de Venda"
  validate :valida_item

   after_save :trg_soma_itens
  
  after_destroy :trg_soma_itens

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

  def calcula_desconto
    self.desconto = (self.valor_tabela - self.valor_venda) / self.valor_tabela * 100
  end

  # rotina para Somar os Itens e Atualizar no Pedido
  def trg_soma_itens
    self.pedido.gerenciar_acoes
    self.pedido.save
  end

  public 
  def sub_total
    self.quantidade * self.valor_venda
  end
end
