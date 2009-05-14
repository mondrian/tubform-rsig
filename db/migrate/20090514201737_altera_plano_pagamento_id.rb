class AlteraPlanoPagamentoId < ActiveRecord::Migration
  def self.up
    remove_column :pedidos, :plano_pagamento_id
    add_column :pedidos, :plano_de_pagamento, :string
  end

  def self.down
    add_column :pedidos, :plano_pagamento_id, :integer
    remove_column :pedidos, :plano_de_pagamento
  end
end

