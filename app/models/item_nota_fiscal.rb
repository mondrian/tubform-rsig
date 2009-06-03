class ItemNotaFiscal < ActiveRecord::Base
  has_one :produto
  belongs_to :nota_fiscal
end
