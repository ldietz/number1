class Sr71 < ActiveRecord::Migration
  def self.up
    require 'nokogiri'
    require 'open-uri'
    doc = Nokogiri::HTML(open("http://www.azlyrics.com/lyrics/sr71/rightnow.html"))
    title = doc.at_css("#h1lyrhead").text
    6.times do title.chop! end
                 Lyric.create(:title => title,
                 :artist => title,
                 :album => title,
                 :year => title,
                 :lyrics => title,
                 :image_url => title )
  end

  def self.down
  end
end
