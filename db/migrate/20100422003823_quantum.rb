class Quantum < ActiveRecord::Migration
  def self.up
                Lyric.create(:title => 'Luke Dawg',
                 :artist => 'Luke Dawg',
                 :album => 'Luke Hawg',
                 :year => '1020',
                 :lyrics => "One Two Three Four Five",
                 :image_url => '/images/californication' )
  end

  def self.down
  end
end
