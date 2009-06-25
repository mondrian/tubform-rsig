class AddMinutaIdToItensMinutas < ActiveRecord::Migration
  def self.up
    add_column :itens_minutas, :minuta_id, :integer
  end

  def self.down
    remove_column :minuta_id
  end
end
