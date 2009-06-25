class CreatePedidos < ActiveRecord::Migration
  def self.up
    create_table :pedidos do |t|
      t.boolean :oficial
      t.date :data
      t.date :previsao_entrega
      t.date :entrega
      t.date :programacao
      t.integer :cliente_id
      t.decimal :valor,           :precision => 8, :scale => 2
      t.decimal :preco_tabela,    :precision => 8, :scale => 2
      t.decimal :acrescimo,       :precision => 3, :scale => 2
      t.decimal :desconto,        :precision => 3, :scale => 2
      t.integer :transportadora_id
      t.string :nome_comprador
      t.text :observacao
      t.integer :vendedor_id
      t.integer :operador_id
      t.integer :telemarketing_id
      t.integer :plano_pagamento_id
      t.string :endereco_entrega
      t.integer :minuta_id
      t.integer :area_id
      t.boolean :preco_especial
      t.string :status
      t.date :estorno
      t.integer :funcionario_estorno_id
      t.decimal :comissao_vendedor,       :precision => 3, :scale => 2
      t.decimal :comissao_telemarketing,  :precision => 3, :scale => 2
      t.boolean :venda_externa
      t.decimal :desconto_complementar,   :precision => 3, :scale => 2
      t.integer :autorizador_desconto_id

      t.timestamps
    end
  end

  def self.down
    drop_table :pedidos
  end
end
