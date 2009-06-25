class ItemPedidoKit < ActiveRecord::Base
  belongs_to :pedido
  belongs_to :produto_kit

  # ATENçÃO: A tabela pedidoit.dbf deverá receber os dados enviado por esse método.
  # -------------------------------------------------------------------------------
  def dbf_delete
    sql = "select excluir_item_pedido_kit_dbf(#{self.pedido.id.to_s}, #{self.produto.id.to_s})"
    x = ItemPedidoKit.replicando_no_banco(sql)
  end

  def dbf_insert
    # montar nesse ponto as variaveis para a funcao
    # a funcao de insert no dbf recebe como parametros todos os campos da tabela
    # na mesma ordem do dbf
    # o mais importante e tratar os dados para o formato que o dbf va suportar
    # podemos ver essa parte juntos, coloquem os valores corretos e a gente testa ai
    #vtipo = 1.to_i ? self.tipo == 'I' : vtipo = 2

    # ATENçÃO: A tabela pedidoit.dbf deverá receber os dados enviado por esse método.
    # -------------------------------------------------------------------------------
    sql = ItemPedidoKit.retorna_sql(["select inserir_item_pedido_kit_dbf(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) as resultado",
                                  self.pedido.id.to_s,
                                  self.produto.id.to_s,
                                  self.quantidade,
                                  self.valor_venda,
                                  SEQ_MOVIME,
                                  SEQ_MOV_DES,
                                  self.valor_tabela,
                                  self.produto.emissao_relatorio,
                                  self.item_pedido_kit.id.to_s,
                                  self.desconto])

    x = ItemPedidoKit.replicando_no_banco(sql)

  end

  def dbf_update
     # montar nesse ponto as variaveis para a funcao
     # a funcao de update no dbf recebe como parametros todos os campos da tabela
     # na mesma ordem do dbf
     # o mais importante e tratar os dados para o formato que o dbf va suportar
     # podemos ver essa parte juntos, coloquem os valores corretos e a gente testa ai
     
     # ATENçÃO: A tabela pedidoit.dbf deverá receber os dados enviado por esse método.
     # -------------------------------------------------------------------------------
     sql = ItemPedidoKit.retorna_sql(["select alterar_item_pedido_kit_dbf(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) as resultado",
                                  self.pedido.id.to_s,
                                  self.produto.id.to_s,
                                  self.quantidade,
                                  self.valor_venda,
                                  SEQ_MOVIME,
                                  SEQ_MOV_DES,
                                  self.valor_tabela,
                                  self.produto.emissao_relatorio,
                                  self.item_pedido_kit.id.to_s,
                                  self.desconto])

    x = ItemPedidoKit.replicando_no_banco(sql)
  end

	def self.replicando_no_banco(s)
		 x = Pedido.find_by_sql("select replica_dbf(#{(s)}) as resultado")
     x = x[0].resultado
	end
end

