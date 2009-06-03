class CreateFornecedores < ActiveRecord::Migration
  def self.up
    create_table :fornecedores do |t|
      t.string :nome, :null => false
      t.string :endereco, :null => false
      t.string :cnpj, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :fornecedores
  end
end
