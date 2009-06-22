class ItemPedido < ActiveRecord::Base
  belongs_to :pedido
  belongs_to :produto

  validates_presence_of :quantidade, :message => "Informe a Quantidade"
  validates_numericality_of :quantidade, :message => "Informe Apenas Números"
  validate :valida_item
  

  #before_save :trg_soma_itens
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

  #def dbf_insert
     # montar nesse ponto as variaveis para a funcao
     # a funcao de insert no dbf recebe como parametros todos os campos da tabela
     # na mesma ordem do dbf
     # o mais importante e tratar os dados para o formato que o dbf va suportar
     # podemos ver essa parte juntos, coloquem os valores corretos e a gente testa ai
     #vtipo = 1.to_i ? self.tipo == 'I' : vtipo = 2
     #sql = ItemPedido.retorna_sql(["select inserir_item_pedido_dbf(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) as resultado",
     #                                self.pedido.id, self.produto.id, self.quantidade, self.valor_venda, , SEQ_MOVIME,
     #                                SEQ_MOV_DES, self.valor_tabela, self.produto.emissao_relatorio, self.item_pedido_kit.id,
     #                                self.desconto])
     #
=begin
     t.decimal  "quantidade"
     t.decimal  "valor_tabela"
     t.decimal  "valor_venda"
     t.decimal  "desconto"
     t.datetime "created_at"
     t.datetime "updated_at"
     t.integer  "produto_id"
     t.integer  "pedido_id"
     t.boolean  "emissao_relatorio"     (vem da tabela de produto)

     1  NUM_PEDIDO  Character      8
     2  COD_PRODUT  Character      5
     3  QTD_ITEPED  Numeric        7
     4  VAL_ITEPED  Numeric       11      2
     5  CONTADOR    Character      1
     6  SEQ_MOVIME  Character      3
     7  SEQ_MOVDES  Character      3
     8  VAL_ITENOR  Numeric       10      2
     9  STA_EMIREL  Logical        1
    10  COD_PROKIT  Character      5
    11  PER_DSCITE  Numeric        6      2
=end     
  #   x = Pedido.find_by_sql(sql)
  #   x = x[0].resultado
  #
  #end

 end