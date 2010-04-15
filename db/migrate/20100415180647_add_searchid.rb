class AddSearchid < ActiveRecord::Migration
  def self.up
    add_column :lyrics, :category_id, :integer
  end

  def self.down
    remove_column :lyrics, :category_id
  end
end
