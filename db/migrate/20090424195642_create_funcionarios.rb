class CreateFuncionarios < ActiveRecord::Migration
  def self.up
    create_table :funcionarios do |t|
      t.boolean :tipo
      t.string :nome
      t.string :endereco
      t.string :complemento
      t.string :cep
      t.integer :cidade_id
      t.string :uf
      t.string :fone
      t.string :cpf
      t.string :rg
      t.string :pai
      t.string :mae
      t.string :numero_carteira_trabalho
      t.string :serie_carteira_trabalho
      t.string :titulo_eleitor
      t.string :zona_eleitoral
      t.date :admissao
      t.date :registro
      t.date :nascimento
      t.string :naturalidade
      t.string :estado_civil
      t.string :grau_instrucao
      t.date :cadastro_pis
      t.string :numero_pis
      t.string :cod_banco_pis
      t.string :nome_banco_pis
      t.string :cod_agencia_pis
      t.string :nome_agencia_pis
      t.string :endereco_banco_pis
      t.date :demissao
      t.text :observacao
      t.text :aci
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :funcionarios
  end
end
