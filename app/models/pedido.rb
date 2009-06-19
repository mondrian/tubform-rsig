class Pedido < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :vendedor, :class_name => 'Funcionario', :foreign_key => 'vendedor_id'
  belongs_to :operador, :class_name => 'Funcionario', :foreign_key => 'operador_id'
  belongs_to :funcionario, :class_name => 'Funcionario', :foreign_key => 'funcionario_id'
  belongs_to :telemarketing, :class_name => 'Funcionario', :foreign_key => 'telemarketing_id'
  belongs_to :autorizador, :class_name => 'Funcionario', :foreign_key => 'autorizador_id'

  belongs_to :transportadora
  belongs_to :minuta
  belongs_to :area
  has_many   :item_pedidos, :dependent => :destroy
  has_many   :produtos, :through => :item_pedidos
  has_many   :duplicatas, :dependent => :destroy

  validates_presence_of :tipo, :message => "Informe o Tipo de Pedido"
  validates_presence_of :data, :message => "Informe a Data do Pedido..."
  validates_presence_of :cliente_id, :message => "Informe o Código do Cliente"
  validates_presence_of :operador_id, :message => "Operador não Informado, verifique ...."

  before_save :trg_save
  after_update :trg_save
  #after_create :dbf_insert

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
    faixa_de_desconto = FaixaDeDesconto.find(:first, :conditions => "#{self.prazo_medio} >= de and #{self.prazo_medio} <= ate")
    self.desconto < faixa_de_desconto.desconto_permitido
  end

  #def aprovar
    #self.entrega = Time.now
    #self.status = 'A'
    # Tem que rever isso aqui
  #end

  # Calculo de comissao por desconto do item.
  def comissao_desconto_item
    percentual_reducao = 0.150  #percentual de redução da comissão para cada 1% de desconto no item. (parametro).
    comissao_padrao = 5.00      #Percentual de comissão do vendedor por industria.
    desconto_padrao = 23.00     #Percentual de desconto maximo por item permitido.
    comissao = 0.00             #variavel local.
    vlr_comissao = 0.00         #variavel local.

    # Exemplo do calculo abaixo: 5.5-((25-23)*0.150)
    for item_pedido in self.item_pedidos
      if item_pedido.desconto > 0
        if item_pedido.desconto <= desconto_padrao
          comissao = (comissao_padrao - ((item_pedido.desconto - comissao_padrao) * percentual_reducao ))
        else
          comissao = comissao_padrao
        end
        if comissao < 0
          comissao = 0
        else
         vlr_comissao += ( ((item_pedido.valor_venda.to_f * item_pedido.quantidade.to_f) * comissao) / 100 )
        end
      else
        comissao = comissao_padrao
        vlr_comissao += ( ((item_pedido.valor_venda.to_f * item_pedido.quantidade.to_f) * comissao) / 100 )
      end
    end
    if self.valor.nil?
       self.valor = 1
       vlr_comissao = 0
    end
    vlr_comissao = 0 if vlr_comissao.nil?
    if self.valor > 0
       percentual_comissao =  ((vlr_comissao / self.valor) * 100).to_f
    else
       percentual_comissao = 0
    end

  end

  # A cada 15 dias de prazo acima do parametro, será calculada uma Unidade de Desconto na
  # comissão do Vendedor, conforme abaixo
  def desconto_comissao_prazo!
    prazo_param = 75  # Deverá vir da Tabela de Parâmetros ( param.prazo_medio )
    comissao = self.comissao_desconto_item / 100   # Retorno de desconto por item
    unidade = 15.000  # Deverá vir da Tabela de Parâmetros ( param.unidade )
    fator = 0.500     # Deverá vir da Tabela de Parâmetros ( param.fator )
    prazo_pedido = self.prazo_medio
    valor_comissao = 0

    # Verifica se o Vendedor "estourou" o prazo do Cliente e Aplica a Regra
    if(prazo_pedido > prazo_param)
      for i in self.item_pedidos do
        valor_total = i.valor_venda * i.quantidade
        desconto = ((prazo_pedido - prazo_param ) / unidade) * fator
        valor_base = valor_total - ( desconto * valor_total )
        valor_comissao += valor_base * comissao
      end

      # Atualiza o valor da Comissão na Tabela de Pedidos
      self.comissao_vendedor =  valor_comissao / self.valor * 100
    end
  end

  #metodo que retorna a media ponderada dos descontos dos itens do pedido em valor
  def media_desconto_ponderada_itens_valor
    valor = 0
    for i in self.item_pedidos do
       valor += (i.valor_tabela * i.quantidade) * desconto / 100
    end
    valor
  end

  #metodo que retorna a media ponderada dos descontos dos itens do pedido em percentual
  def media_desconto_ponderada_itens_perc
    valor = 0
    for i in self.item_pedidos do
       valor += ((i.valor_tabela * i.quantidade) * i.desconto) / 100
    end
    ret = (valor / self.valor) * 100
  end

  # metodo que acumula o desconto ponderado nos itens + o desconto informado no proprio pedido para chegar ao desconto final do pedido
  def desconto_acumulado_geral
     desc_itens = self.media_desconto_ponderada_itens_perc # tras o desconto ponderado dos itens
     base_desc_ped = self.valor - (self.valor * desc_itens / 100)             # acha a base de calculo para o desconto do pedido
     vl_tot_desc = ((base_desc_ped * self.desconto) / 100) + (self.valor - base_desc_ped)  # acha o valor total de desconto
     rep = (vl_tot_desc / self.valor) * 100                # acha a representação do desconto em cima do valor original do pedido
     rep
  end

  #gerar duplicatas do pedido
  def gerar_duplicatas
     expr =
       begin
         # verifica se ja existem duplicatas para esse pedido
         # se houver e todas estiverem em aberto exclui antes de gerar de novo
         valores = self.valor.reais.parcelar((self.plano_de_pagamento.size / 3))
         datas = self.vencimentos
         i = 0
         duplicatas = self.duplicatas
         if duplicatas.size > 0 then
           for d in duplicatas do
             if d.possui_lancamentos?
               raise StandardError, 'Pedido possui duplicatas pagas'
             end
           end

           for x in duplicatas
             x.delete
           end
         end

         for v in valores do
           p = Duplicata.new
           p.tipo_cobranca = 'C'
           p.plano_de_conta_id = 1
           p.data_emissao = self.data
           p.data_vencimento = datas[i]
           p.valor = v.to_f
           p.cliente_id = p.devedor_id = self.cliente_id
           p.pedido_id = self.id
           p.nome_devedor = nome_comprador
           #p.save
            self.duplicatas << p
           i += 1
         end
        'ok'
        rescue => erro
          self.errors.add_to_base(erro)
          erro
        ensure
           'ok'
        end
     expr
  end

  # metodo de apoio pra quebrar o plano de pagamento, devolve os vencimentos com base no plano informado
  def vencimentos
    quantidade_de_parcelas = self.plano_de_pagamento.size / 3
    prazo = 0
    i = 0
    vencimentos = []

    # Verifica se a data de entrega foi preenchida e regera as duplicatas com base nessa data
    # Se não estiver preenchida, gera com base na data do pedido
    self.entrega.nil? ? data_inicial = self.data : data_inicial = self.entrega
    while i <= self.plano_de_pagamento.size
      prazo = self.plano_de_pagamento[i,3].to_i
      vencimentos << (data_inicial + prazo.days)
      i += 3
    end
    vencimentos
  end

	# Método para Atualizar o Valor do Pedido a cada Item Acrescentado, Excluido ou Alterado
    def somar_itens
      soma = 0
      p = self.item_pedidos
      if p.size > 0
        p.each do | i |
           soma += (i.quantidade * i.valor_venda)
        end
      soma
      end
    end

  # rotina chamada no before save
  def trg_save
    self.gerenciar_acoes
    self.gerar_duplicatas if self.changed.include? "plano_de_pagamento" or self.changed.include? "valor"
  end 

  def gerenciar_acoes
    self.valor =  self.somar_itens
    self.percentual_comissao = self.comissao_desconto_item ? self.comissao_desconto_item : 5
  end

  # deleta os pedidos que não contem items de pedido
  def deleta_pedido_sem_item
 	sql = "DELETE FROM pedidos WHERE id not in ( SELECT distinct(pedido_id) FROM item_pedidos )" 
	Pedido.find_by_sql(sql)
  end

  # metodos para replicacao nos dbfs
  def dbf_delete
    sql = "select excluir_pedido_dbf(#{self.numero_pedido})"
    Pedido.find_by_sql(sql)  
  end

  def self.retorna_sql(s)
    sanitize_sql(s)
  end

  def dbf_insert
     # montar nesse ponto as variaveis para a funcao
     # a funcao de insert no dbf recebe como parametros todos os campos da tabela
     # na mesma ordem do dbf
     # o mais importante e tratar os dados para o formato que o dbf va suportar
     # podemos ver essa parte juntos, coloquem os valores corretos e a gente testa ai
     #vtipo = 1.to_i ? self.tipo == 'I' : vtipo = 2
     self.tipo == 'I' ? vtipo = 1 : vtipo = 2
     sql = Pedido.retorna_sql(["select inserir_pedido_dbf(?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
                                ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) as resultado", self.id.to_s, vtipo, self.data, self.previsao_entrega,
                                nil, nil, self.cliente_id.to_s, nil, nil, nil, nil, nil, self.nome_comprador, self.observacao, self.vendedor_id.to_s, 
                                self.plano_de_pagamento, self.endereco_entrega, nil, nil, nil, nil, nil, self.cliente.cidade_id.to_s, self.area_id.to_s,
                                nil, nil, self.operador_id.to_s, nil, nil, self.registro, self.id.to_s, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil,
                                nil, nil, nil, nil, nil, nil, nil])
     x = Pedido.find_by_sql(sql)
     x = x[0].resultado

  end
    def dbf_update
     # montar nesse ponto as variaveis para a funcao
     # a funcao de update no dbf recebe como parametros todos os campos da tabela
     # na mesma ordem do dbf
     # o mais importante e tratar os dados para o formato que o dbf va suportar
     # podemos ver essa parte juntos, coloquem os valores corretos e a gente testa ai
      sql = Pedido.retorna_sql(["select alterar_pedido_dbf(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
                                                           ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) as resultado",
                                 self.data, self.previsao_entrega, self.entrega, self.programacao, self.cliente_id, self.valor,
                                 self.valor_normal, self.acrescimo, self.desconto, self.transportadora_id, self.nome_comprador,
                                 self.observacao, self.funcionario_id, self.plano_de_pagamento, self.cliente.endereco_entrega,
                                 self.cliente.complemento, self.cliente.cidade_id, self.cliente.regiao_entrega, self.cliente.uf,
                                 self.cliente.cep, self.cliente.cidade_id, self.cliente.area_id, self.minuta_id, self.gera_minuta,
                                 self.funcionario_id, self.especial, self.telemarketing_id, self.estorno, self.data_estorno,
                                 self.funcionario_estorno_id, self.comissao_vendedor, self.comissao_telemarketing,
                                 self.identificador_venda, self.desconto_item, self.autorizador_desconto_id, self.status])
     Pedido.find_by_sql(sql)
  end
end