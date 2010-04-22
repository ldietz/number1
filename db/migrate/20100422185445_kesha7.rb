class Kesha7 < ActiveRecord::Migration
  def self.up
        require 'nokogiri'
    require 'open-uri'
    doc = Nokogiri::HTML(open("http://www.azlyrics.com/lyrics/keha/blahblahblah.html"))
    title = doc.at_css("#h1lyrhead").text
    8.times do title.chop! end
    title = title.slice(1..40)
    artist = doc.at_css(".ArtistTitle").text
    7.times do artist.chop! end
    lyrics = doc.at_css("#LyricsMainTable").to_s
    start_position = lyrics =~ /END OF RINGTONE 1/
    start_position = start_position +24
    end_position = lyrics =~ /<br><br><br><br>/
    end_position = end_position -1
    lyrics =  lyrics.slice!(start_position..end_position)
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
