require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create 
    song = self.new
    self.all << song
    song 
  end  

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song 
  end  

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all << song 
    song 
  end 

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end 
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end 
  
  def self.alphabetical 
    # objects.sort_by {|obj| obj.attribute}
    self.all.sort_by {|song| song.name}
  end 
  
  def self.new_from_filename(filename)   #.new_from_filename(filename)
    song = self.new  #song = self.new
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")  #song = song.new_from_filename("Thundercat - For Love I Come.mp3")
    song.name = song_array[1]  #song.name = "For Love I Come"
    song.artist_name = song_array[0]   #song.artist_name = "Thundercat"
    song
  end  
  
  def self.create_from_filename(filename) #.create_from_filename(filename)
    files = self.new_from_filename(filename) #song_match = song.find_by_name("For Love I Come")
    song = self.create #song = song.create_from_filename("Thundercat - For Love I Come.mp3")
    song.name = files.name #   song_match.name = ("For Love I Come")
    song.artist_name = files.artist_name   # song_match.artist_name = ("Thundercat")
    song
  end 

  def self.destroy_all
    self.all.clear
  end

end 