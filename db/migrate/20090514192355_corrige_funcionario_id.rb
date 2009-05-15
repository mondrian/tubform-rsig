class CorrigeFuncionarioId < ActiveRecord::Migration
  def self.up
    add_column :pedidos, :funcionario_id, :integer
  end

  def self.down
    remove_column :pedidos, :funcionario_id
  end
end

