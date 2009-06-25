class CreateAcoes < ActiveRecord::Migration
  def self.up
    create_table :acoes do |t|
      t.string :controller_name
      t.string :action_name

      t.timestamps
    end
  end

  def self.down
    drop_table :acoes
  end
end
