class RemoveAreaIdFromRoteiros < ActiveRecord::Migration
  def self.up
    remove_column :roteiros, :area_id
  end

  def self.down
    add_column :roteiros, :area_id, :integer
  end
end
