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
    
  end
  
  def self.new_by_name(song_name)
    
  end
  
  def self.create_by_name(song_name)
    
  end
  
  def self.find_by_name(song_name)
    
  end
  
  def self.find_or_create_by_name(song_name)
    
  end
  
  def self.alphabetical
    
  end
  
  def self.new_from_filename(filename)
    
  end
  
  def self.create_from_filename(filename)
    
  end
  
  def  self.destroy_all
    @@all.clear
  end
end
