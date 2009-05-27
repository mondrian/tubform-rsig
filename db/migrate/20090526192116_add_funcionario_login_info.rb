class AddFuncionarioLoginInfo < ActiveRecord::Migration
  def self.up
    add_column :funcionarios, :login,      								:string, :limit => 40
    add_column :funcionarios, :crypted_password,          :string, :limit => 40
    add_column :funcionarios, :salt,                      :string, :limit => 40
    add_column :funcionarios, :remember_token,            :string, :limit => 40
    add_column :funcionarios, :remember_token_expires_at, :datetime
    add_index  :funcionarios, :login, :unique => true
  end

  def self.down
    remove_column :funcionarios, :login
    remove_column :funcionarios, :crypted_password
    remove_column :funcionarios, :salt
    remove_column :funcionarios, :remember_token
    remove_column :funcionarios, :remember_token_expires_at
  end
end
