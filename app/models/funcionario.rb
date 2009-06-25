require 'digest/sha1'

class Funcionario < ActiveRecord::Base

  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  has_many :notasfiscais
  belongs_to :cidade
  has_and_belongs_to_many :acoes


  validates_presence_of :tipo, :message => "Informe o Tipo do Funcionário"
  validates_presence_of :nome, :message => "Informe o Nome do Funcionário"
  validates_presence_of :endereco, :message => "Informe Endereço do Funcionário"
  validates_uniqueness_of :cpf, :message => "Já existe um Funcionário com esse CPF"
  validates_uniqueness_of :rg,  :message => "Já existe um Funcionário com esse RG"

  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message


  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message

  

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email,  :password, :password_confirmation



  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def popula_acoes
    self.acoes = Acao.find(:all)    
    self.save
  end

  def name
		self.nome
  end

  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_by_login(login.downcase) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end

  protected
   

end
