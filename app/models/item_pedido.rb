class ItemPedido < ActiveRecord::Base
  belongs_to :pedido
  belongs_to :produto

  validates_presence_of :quantidade, :message => "Informe a Quantidade"
  validates_numericality_of :quantidade, :message => "Informe Apenas Números"
  validate :valida_item

  #before_save :trg_soma_itens
  after_save :trg_soma_itens

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

  def dbf_delete
    sql = "select excluir_item_pedido_dbf(#{self.pedido.id.to_s}, #{self.produto.id.to_s})"
    ItemPedido.find_by_sql(sql)
  end

  def dbf_insert
    # montar nesse ponto as variaveis para a funcao a funcao de insert no dbf recebe como parametros todos os campos da tabela
    # na mesma ordem do dbf o mais importante e tratar os dados para o formato que o dbf va suportar
    # podemos ver essa parte juntos, coloquem os valores corretos e a gente testa ai
    sql = ItemPedido.retorna_sql(["select inserir_item_pedido_dbf(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) as resultado",
                                  self.pedido.id.to_s,
                                  self.produto.id.to_s,
                                  self.quantidade,
                                  self.valor_venda,
                                  SEQ_MOVIME,
                                  SEQ_MOV_DES,
                                  self.valor_tabela,
                                  self.produto.emissao_relatorio,
                                  self.item_pedido_kit.id,
                                  self.desconto])

    x = ItemPedido.find_by_sql(sql)
    x = x[0].resultado

  end

  def dbf_update
     # montar nesse ponto as variaveis para a funcao a funcao de update no dbf recebe como parametros todos os campos da tabela
     # na mesma ordem do dbf o mais importante e tratar os dados para o formato que o dbf va suportar
     # podemos ver essa parte juntos, coloquem os valores corretos e a gente testa ai
     sql = ItemPedido.retorna_sql(["select alterar_item_pedido_dbf(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) as resultado",
                                  self.pedido.id.to_s,
                                  self.produto.id.to_s,
                                  self.quantidade,
                                  self.valor_venda,
                                  SEQ_MOVIME,
                                  SEQ_MOV_DES,
                                  self.valor_tabela,
                                  self.produto.emissao_relatorio,
                                  self.item_pedido_kit.id,
                                  self.desconto])

    x = ItemPedido.find_by_sql(sql)
    x = x[0].resultado
  end
end

