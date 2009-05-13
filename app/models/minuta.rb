class Minuta < ActiveRecord::Base
  has_one :roteiro
  has_many :itens_minutas

  validates_presence_of :data, :message => "Informe a Data da Minuta"
end
