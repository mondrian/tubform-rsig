class Cliente < ActiveRecord::Base
  before_save :remove_mascara
  has_many :pedidos
  has_many :notasfiscais
  belongs_to  :cidade
  has_one  :regiao_entrega, :class_name => 'Regiao', :foreign_key => 'regiao_entrega_id'
  has_one  :cidade_entrega, :class_name => 'Cidade', :foreign_key => 'cidade_entrega_id'
  has_one  :area
  
  validates_presence_of :razao_social, :message => "Informe a RAZÃO SOCIAL"
  validates_presence_of :nome_fantasia, :message => "Informe o Nome de Fantasia"
  validates_presence_of :cidade_id, :message => "Informe Cidade do Cliente"
  validates_uniqueness_of :cpf, :message => 'CPF já Cadastrado'
  validates_uniqueness_of :cnpj, :message => 'CNPJ já Cadastrado'


  private
  def remove_mascara
    self.cpf.gsub!(/[^0-9]/,'') if !self.cpf.nil?
    self.cnpj.gsub!(/[^0-9]/,'') if !self.cnpj.nil?
    self.fone_pessoal.gsub!(/[^0-9]/,'') if !self.fone_pessoal.nil?
    self.fone_comercial.gsub!(/[^0-9]/,'') if !self.fone_comercial.nil?
    self.fone_celular.gsub!(/[^0-9]/,'') if !self.fone_celular.nil?
    self.cep.gsub!(/[^0-9]/,'') if !self.cep.nil?
  end
end
