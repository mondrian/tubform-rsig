class AlterarFuncionarioTipo < ActiveRecord::Migration
  def self.up
    change_column :funcionarios, :tipo, :string, :limit => 1
  end

  def self.down
    # dependendo dos valores, nao daria pra voltar pra boleano 
    remove_column :funcionarios, :tipo
    add_column :funcionarios, :tipo, :boolean
  end
end
