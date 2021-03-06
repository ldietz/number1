
module PopulateLyrics
  def run
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'

    main_url = "http://azlyrics.com/"
    main_page = Nokogiri::HTML(open(main_url))

    #This will go through A-Z links on the main page.
    main_page.css(".AtoZ a").each do |letter|
      artists_page = Nokogiri::HTML(open(letter[:href])) #[:href] returns the url out of the <a> element
      artists_page.css("#container1 a").each do |artist|
        unless artist[:rel] == 'external'
          @albums = Array.new
          @artist = Artist.create(:name => artist.content)
          songs_page = Nokogiri::HTML(open(main_url + artist[:href]))
          songs_page.css(".Page b").each {|album| @albums << album.text}
          @num = 0
          songs_page.css(".Page p").each do |album|
            @num += 1
            @album = Album.create(:artist_id => @artist.id, :album => @albums[@num-1], :year => " ", :photo_url => " ")
            puts "Album Iteration: #{@num}: #{@albums[@num-1]}"
            album.css("a").each do |song|
              puts "Album Iteration: #{@num}: #{@albums[@num-1]}"
              song_album = @albums[@num - 1]
              if song_album && song[:class] != 'Ringtones'
                unless song[:href][/amazon/] || song[:href][/http/]
                  song_url = song[:href].gsub('..', '')
                  puts song_url
                  lyric_page = Nokogiri::HTML(open(main_url.chop + song_url))  rescue  OpenURI::HTTPError
                  unless lyric_page == OpenURI::HTTPError
                    song_artist  = lyric_page.at_css(".ArtistTitle").content
                    song_title = song.content
                    song_lyrics = lyric_page.at_css("#LyricsMainTable")
                    start_position = song_lyrics.to_s =~ /END OF RINGTONE 1/
                    start_position = start_position +24
                    end_position = song_lyrics.to_s =~ /<br><br><br><br>/
                    end_position = end_position -1
                    song_lyrics =  song_lyrics.to_s.slice!(start_position..end_position)

                    Song.create(:album_id => @album.id, :title => song_title, :lyrics => song_lyrics )	
                    
                    
                  #  Lyric.create(:title => song_title,
                  #               :artist => song_artist,
                  #               :album => song_album,
                  #               :year => "",
                  #               :lyrics => song_lyrics,
                  #               :image_url => "" )
                    
                    
                    puts song_artist
                    puts song_title
                    puts song_album
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
