class Song
  attr_accessor :name, :artist_name
  @@all = []
 
  def self.all
    @@all
  end
 
  def save
    self.class.all << self
  end
 
  def self.create           #class method called create, that when called, instantiates a new
    song = self.new         #instance and stores it to a local variable called song. .save instance
    song.save               #method is called on the variable song which does: the instance is
    song                    #shoveled into class.all (or Song.all) which as a class method
  end                       #available to the whole class and access the array called all. At the 
                            #end of the creat method, song returns the instance that wa
                             #initialised and saved.  
  
  def self.new_by_name(name)  #name setter method is evoked on song variable and takes the value in
    song = self.new           #name argument. song variable now also conatians the name argument.
    song.name = name          #finally the instance is called.
    song
  end

  def self.create_by_name(name) #same as above but with instance method save evoked
    song = self.new           
    song.name = name          
    song.save                 
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name) 
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  
  def self.new_from_filename(filename)
    new_file = filename.split(" - ")
    artist = new_file[0]
    song_name = new_file[1].gsub(".mp3", "")
    song = self.new
    song.name = song_name
    song.artist_name = artist
    song
  end
  
  #split argument filename (string) by - character and set to new variable (now an array)
  #take the first element/value from the new array and point that to a new local variable.
  #take the second value fomr the array and substitute .mp3 for nothing and set the result to new local variable.
  #create a new instance from all of the above, and set to variable called song.
  #set value from song_name variable to name variable of song.
  #set value from artist variable to artist_name variable of song
  #return value of song
  
  def self.create_from_filename(filename)
    new_file = filename.split(" - ")
    artist = new_file[0]
    song_name = new_file[1].gsub(".mp3", "")
    song = self.new
    song.name = song_name
    song.artist_name = artist
    song.save
    song
    
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  
  
  
  
end