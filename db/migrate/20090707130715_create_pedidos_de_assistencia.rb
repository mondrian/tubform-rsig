class CreatePedidosDeAssistencia < ActiveRecord::Migration
  def self.up
    create_table :pedidos_de_assistencia do |t|
      t.date :data
      t.date :previsao_entrega
      t.date :entrega
      t.date :programacao
      t.integer :cliente_id
      t.decimal :valor,                                 :precision => 8,  :scale => 2, :default => 0.0
      t.decimal :acrescimo,                             :precision => 8,  :scale => 2, :default => 0.0
      t.decimal :desconto,                              :precision => 8,  :scale => 2, :default => 0.0
      t.integer :transportadora_id
      t.string :nome_comprador
      t.text :observacao
      t.integer :vendedor_id
      t.integer :operador_id
      t.integer :telemarketing_id
      t.string :endereco_entrega
      t.integer :minuta_id
      t.integer :area_id
      t.string :status
      t.integer :funcionario_estorno_id
      t.boolean :venda_externa
      t.decimal :desconto_complementar,                :precision => 6,  :scale => 2, :default => 0.0
      t.integer :autorizador_desconto_id
      t.date :registro
      t.integer :empresa_id
      t.integer :operador_estorno_id
      t.integer :autorizador_id
      t.string :plano_de_pagamento
      t.string :tipo,                                  :limit => 1
      t.decimal :valor_normal,                         :precision => 12, :scale => 2, :default => 0.0
      t.boolean :gera_minuta,                          :default => true
      t.date :data_estorno
      t.string :identificador_venda,                   :limit => 1
      t.decimal :total_desconto_item,                  :precision => 12, :scale => 2, :default => 0.0
      t.string :nosso_numero,                          :limit => 7
      t.boolean :status_estorno
      t.timestamps
    end
  end

  def self.down
    drop_table :pedidos_de_assistencia
  end
end
