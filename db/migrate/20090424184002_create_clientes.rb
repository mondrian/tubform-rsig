class CreateClientes < ActiveRecord::Migration
  def self.up
    create_table :clientes do |t|
      t.string :tipo_cliente, :limit => 1
      t.string :cpf_cnpj, :limit => 14
      t.string :razao_social
      t.string :nome_fantasia
      t.string :documento
      t.string :endereco
      t.string :complemento
      t.integer :cidade_id
      t.integer :uf_id
      t.string :cep
      t.string :referencia
      t.string :fone_pessoal
      t.string :fone_comercial
      t.string :fone_celular
      t.string :endereco_entrega
      t.integer :regiao_entrega_id
      t.string :cidade_entrega_id
      t.string :area_id
      t.text :referencias_bancaria
      t.text :referencias_comerciais
      t.text :observacao
      t.text :info_serasa
      t.date :data_nascimento
      t.string :nome_comprador
      t.boolean :vendas_suspensas
      t.text :observacao_suspensao_venda
      t.decimal :limite_credito, :precision => 12, :scale => 2
      t.decimal :saldo_devedor, :precision => 12, :scale => 2
      t.string :status
      t.integer :prazo_medio_maximo
      t.date :data_inclusao_prazo_medio

      t.timestamps
    end
  end

  def self.down
    drop_table :clientes
  end
end
