class Song < ActiveRecord::Base
  belongs_to :album
  belongs_to :artist

  def self.search(search)
    find(:all, :conditions => ['album_id LIKE ?',"#{search}"])
  end
  
end
