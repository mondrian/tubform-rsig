class NotaFiscal < ActiveRecord::Base
  has_many :itens, :class_name => 'ItemNotaFiscal'
  belongs_to :cliente
  belongs_to :funcionario
  has_many   :produtos, :through => :item_pedidos

  #validates_uniqueness_of :numero_nota,   :message => "Esse Número já foi utilizado em outra Nota "

  validates_presence_of :numero_nota,     :message => "Informe o Número da Nota"
  validates_presence_of :selo,     :message => "Informe o Número do Selo"
  validates_presence_of :serie,    :message => "Informe a Série do Selo"
  validates_presence_of :percentual_icms, :message => "Informe o % de ICMS"
  validates_presence_of :emissao,         :message => "Informe a Data de Emissão"
  validates_presence_of :cfop,            :message => "Informe CFOP"
  validates_presence_of :natureza_operacao, :message => "Informe Natureza da Operação" 
  validates_presence_of :qtde_volumes,    :message => "Informe Quantidade de Volumes" 
    
  validates_numericality_of   :percentual_icms

  def atualiza_total_mercadoria!
     soma = 0
     for item in self.itens do 
       soma += item.quantidade * item.valor_item
     end
   self.total_mercadoria = soma
   self.save
   soma
  end

  def atualiza_total_nota!
    soma = 0
    ipi = 0
    for item in self.itens do 
      soma += (item.quantidade * item.valor_item) 
      ipi +=  (((item.quantidade * item.valor_item) * item.perc_ipi).to_f/100)
    end
    self.total_nota = soma + ipi + self.valor_frete
    self.valor_ipi = ipi
    self.save
    soma + ipi
  end 

  def atualiza_total_icms!
    soma = 0
    icms = 0
    for item in self.itens do 
      soma += (item.quantidade * item.valor_item) if item.perc_icms != 0
      icms +=  (((item.quantidade * item.valor_item) * item.perc_icms).to_f/100) if item.perc_icms != 0
    end
    self.base_calculo_icms = soma
    self.valor_icms = icms
    self.save
  end

	def importa_pedido!(id)
		
		pedido = Pedido.find(id.to_i)
		#para testar o operador
		funcionario = Funcionario.find(:first)
		self.numero_nota = 0
		self.percentual_icms = 0
		self.total_mercadoria = 0
		self.valor_frete = 0
		self.valor_ipi = 0
		self.total_nota = 0
		self.valor_desconto = 0
		self.base_calculo_icms = 0
		self.valor_icms = 0
		self.qtde_volumes = 0
		self.transportadora_id = 0
		self.percentual_desconto = 0
		self.base_calculo_icms_substituicao_tributaria = 0 
		self.percentual_icms_substituicao_tributaria = 0
		self.valor_icms_substituicao_tributaria = 0
    #para testar o operador
		self.operador_id = funcionario.id
		self.emissao = Date.today
    self.selo = self.serie = self.cfop = self.natureza_operacao = self.status = "0"
    self.pedido_id = pedido.id
    self.cliente_id = pedido.cliente_id
		self.save		
	
		for i in pedido.item_pedidos do
			it = ItemNotaFiscal.new
      it.produto_id = i.produto_id
      it.nota_fiscal_id = self.id
  		it.unidade = 'un'
			it.quantidade = i.quantidade
			it.valor_item = i.valor_venda
			it.valor_original = i.valor_tabela
			it.perc_icms = it.perc_ipi = it.peso_liquido = 0
			it.codigo_emissao = '0'
			it.nota_fiscal_id = self.id
      it.save
      self.itens << it
		end
  end

	def importa_pedidos!(id)
		ids = id.split(',')
		pedidos = Pedido.find_all_by_id(ids)
		#para testar o operador
		funcionario = Funcionario.find(:first)
		self.numero_nota = 0
		self.percentual_icms = 0
		self.total_mercadoria = 0
		self.valor_frete = 0
		self.valor_ipi = 0
		self.total_nota = 0
		self.valor_desconto = 0
		self.base_calculo_icms = 0
		self.valor_icms = 0
		self.qtde_volumes = 0
		self.transportadora_id = 0
		self.percentual_desconto = 0
		self.base_calculo_icms_substituicao_tributaria = 0 
		self.percentual_icms_substituicao_tributaria = 0
		self.valor_icms_substituicao_tributaria = 0
    #para testar o operador
		self.operador_id = funcionario.id
		self.emissao = Date.today
    self.selo = self.serie = self.cfop = self.natureza_operacao = self.status = "0"
    self.pedido_id = pedidos[0].id
    self.cliente_id = pedidos[0].cliente_id
		self.save	
	
	  pedidos.each do |pedido|
			for i in pedido.item_pedidos do
				it = ItemNotaFiscal.new
		    it.produto_id = i.produto_id
		    it.nota_fiscal_id = self.id
				it.unidade = 'un'
				it.quantidade = i.quantidade
				it.valor_item = i.valor_venda
				it.valor_original = i.valor_tabela
				it.perc_icms = it.perc_ipi = it.peso_liquido = 0
				it.codigo_emissao = '0'
				it.nota_fiscal_id = self.id
		    it.save
		    self.itens << it
			end
		end
	end
end
