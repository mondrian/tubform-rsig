class Cliente < ActiveRecord::Base
  before_save :remove_mascara
  has_many :pedidos
  belongs_to  :cidade
  has_one  :regiao_entrega, :class_name => 'Regiao', :foreign_key => 'id'
  has_one  :cidade_entrega, :class_name => 'Cidade', :foreign_key => 'id'
  has_one  :area
  has_many :notas_fiscais

  validates_presence_of :razao_social, :message => "Informe a RAZÃO SOCIAL"
  validates_presence_of :nome_fantasia, :message => "Informe o Nome de Fantasia"
  validates_presence_of :cidade_id, :message => "Informe Cidade do Cliente"
  #validates_uniqueness_of :cpf, :message => 'CPF já Cadastrado'
  #validates_uniqueness_of :cnpj, :message => 'CNPJ já Cadastrado'

#  usar_como_cpf :cpf
#  usar_como_cnpj :cnpj

private
  def remove_mascara
    self.cpf.gsub!(/[^0-9]/,'') if !self.cpf.nil?
    self.cnpj.gsub!(/[^0-9]/,'') if !self.cnpj.nil?
    self.fone_pessoal.gsub!(/[^0-9]/,'') if !self.fone_pessoal.nil?
    self.fone_comercial.gsub!(/[^0-9]/,'') if !self.fone_comercial.nil?
    self.fone_celular.gsub!(/[^0-9]/,'') if !self.fone_celular.nil?
    self.cep.gsub!(/[^0-9]/,'') if !self.cep.nil?
    self.razao_social.upcase!
  end

public
  def ativo?
    !self.status
  end

  def verifica_cnpj
  	if (self.cpf.nil? and self.cnpj.nil?)
  	  errors.add_to_base("CPF ou CNPJ Obrigatorio!")
  	end

  	if !self.cpf.nil? then
  	  begin
        cpf = Cliente.find_by_cpf(self.cpf)
        if cpf then
          errors.add_to_base("CPF Já Cadastrado!")
        end
  	  end
  	end

  	if !self.cnpj.nil? then
  	  begin
        cnpj = Cliente.find_by_cnpj(self.cnpj)
        if cpf then
          errors.add_to_base("CNPJ Já Cadastrado!")
        end
  	  end
  	end

 end
  
 def cnpj_cpf
    if self.tipo_cliente = 'F'
      self.cpf
    else
      self.cnpj
    end
 end

 def ie_rg
   if self.tipo_cliente = 'F'
     self.documento
   else
     self.inscricao_estadual
  end
 end

end
