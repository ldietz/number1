class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.string :title
      t.text :lyrics
      t.references :album
      t.timestamps
    end
  end

  def self.down
    drop_table :songs
  end
end
