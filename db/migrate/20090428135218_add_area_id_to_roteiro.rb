class AddAreaIdToRoteiro < ActiveRecord::Migration
  def self.up
    add_column :roteiros, :area_id, :string
  end

  def self.down
    remove_column :roteiros, :area_id
  end
end
