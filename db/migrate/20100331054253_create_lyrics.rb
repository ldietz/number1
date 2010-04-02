class CreateLyrics < ActiveRecord::Migration
  def self.up
    create_table :lyrics do |t|
      t.string :title
      t.string :artist
      t.string :album
      t.string :year
      t.text :lyrics
      t.string :image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :lyrics
  end
end
