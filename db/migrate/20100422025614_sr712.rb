class Sr712 < ActiveRecord::Migration
  def self.up
    require 'nokogiri'
    require 'open-uri'
    doc = Nokogiri::HTML(open("http://www.azlyrics.com/lyrics/sr71/rightnow.html"))
    title = doc.at_css("#h1lyrhead").text
    7.times do title.chop! end
    title.slice!(1..40)
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
