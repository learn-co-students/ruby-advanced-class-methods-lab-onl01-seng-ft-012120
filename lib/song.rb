
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
    @@all << song 
    song 
    
  end 
  
  def self.new_by_name(string)
    song = self.new
    song.name = string
    song
  end 
  
  def self.create_by_name(string)
    song = self.new
    song.name = string 
    @@all << song 
    song
  end 
    
  def self.find_by_name(string)
    @@all.find do |names|
     names.name == string
    end
   
  end 
  
  def self.find_or_create_by_name(string)
   
   if  self.find_by_name(string)
      self.find_by_name(string)
   else 
     self.create_by_name(string)
     
   end
  end
  
  def self.alphabetical
    array = @@all.sort_by {|names| names.name}
    array
      
  end
  
  def self.new_from_filename(filename)
    array = filename.split(" - ")
    arrays = array[1].chomp(".mp3")
    song = self.new
    song.name = arrays
    song.artist_name = array[0]
    song 
  end 
  
  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end 
  
  def self.destroy_all
    @@all.clear
  end 
     
    
    

end
