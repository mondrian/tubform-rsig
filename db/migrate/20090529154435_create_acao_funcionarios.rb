class CreateAcaoFuncionarios < ActiveRecord::Migration
  def self.up
    create_table :acoes_funcionarios do |t|
      t.integer :acao_id
      t.integer :funcionario_id

      t.timestamps
    end
  end

  def self.down
    drop_table :acoes_funcionarios
  end
end
