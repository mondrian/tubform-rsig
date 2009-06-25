class Expedicao < ActiveRecord::Base
  has_one :minuta
  has_one :produto

  validates_presence_of :produto, :message => "Expedição sem Produto"
  validates_presence_of :minuta, :message => "Expedição sem Minuta"
end
