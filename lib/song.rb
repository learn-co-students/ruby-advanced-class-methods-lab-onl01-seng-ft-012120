class Song
  attr_accessor :name, :artist_name
 
  @@all = []
  
  def self.all
    @@all
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

 def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

 def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort {|a, b| a.name<=>b.name}
  end
  
  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist_name = data[0]
    song_name_data = data[1].split(".")
    song_name = song_name_data[0]
    
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(filename)
    data = filename.split(" - ")
    artist_name = data[0]
    song_name_data = data[1].split(".")
    song_name = song_name_data[0]
    
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    self.all << song  
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    self.class.all << self
  end
end
