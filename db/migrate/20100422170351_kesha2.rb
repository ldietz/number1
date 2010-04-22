class Kesha2 < ActiveRecord::Migration
  def self.up
    require 'nokogiri'
    require 'open-uri'
    doc = Nokogiri::HTML(open("http://www.azlyrics.com/lyrics/keha/yourloveismydrug.html"))
    title = doc.at_css("#h1lyrhead").text
    8.times do title.chop! end
    title = title.slice(1..40)
    artist = doc.at_css(".ArtistTitle").text
    7.times do artist.chop! end
    lyrics = doc.at_css("#LyricsMainTable").to_s
    save = 0;
    lyrics.each_line do |text|
      if save < 41
        text = ""
      end
      save = save+1
    end
    
                 Lyric.create(:title => title,
                 :artist => artist,
                 :album => title,
                 :year => title,
                 :lyrics => lyrics,
                 :image_url => title )
  end

  def self.down
  end
end
