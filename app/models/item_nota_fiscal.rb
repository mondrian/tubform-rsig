class ItemNotaFiscal < ActiveRecord::Base
  has_many   :produtos
  belongs_to :produto
  belongs_to :nota_fiscal
end
