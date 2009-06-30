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
end
