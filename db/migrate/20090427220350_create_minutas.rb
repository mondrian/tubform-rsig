class CreateMinutas < ActiveRecord::Migration
  def self.up
    create_table :minutas do |t|
      t.date :data
      t.date :fechamento
      t.integer :operador_fechamento_id
      t.date :saida
      t.text :obs
      t.integer :veiculo_id
      t.date :fechamento_financeiro
      t.integer :funcionario_fechamento_financeiro_id
      t.integer :roteiro_id

      t.timestamps
    end
  end

  def self.down
    drop_table :minutas
  end
end
