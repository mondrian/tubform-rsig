class Cor < ActiveRecord::Base

  validates_presence_of :descricao
  validates_uniqueness_of :descricao

end
