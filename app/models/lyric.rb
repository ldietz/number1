class Lyric < ActiveRecord::Base
  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "#{search}"])
    else
      find(:all)
    end
  end
  def self.searchall(searchall)
    if searchall
      find(:all, :conditions => ['title LIKE ?', OR 'album LIKE ?', "#{searchall}%"])
    else
      find(:all)
    end
  end
   def self.artistsearch(artistsearch)
     if artistsearch
       find(:all, :conditions => ['artist LIKE ?', "#{artistsearch}%"])
     else
       find(:all)
     end
   end
  def self.albumsearch(albumsearch)
    if albumsearch
      find(:all, :conditions => ['album LIKE ?', "#{albumsearch}%"])
    else
      find(:all)
    end
  end
  def self.titlesearch(titlesearch)
    if titlesearch
      find(:all, :conditions => ['title LIKE ?', "#{titlesearch}%"])
    else
      find(:all)
    end
  end
  
end
