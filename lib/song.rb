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
    new_song = Song.new
    new_song.save
    
    return new_song
  end 
  
  def self.new_by_name(name)
    new_song = Song.create
    new_song.name = name 
    
    return new_song
  end 
  
  def self.create_by_name(name)
    new_song = new_by_name(name)
    new_song.save
    
    return new_song
  end 
  
  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end 
    end
    
    return nil
  end 
  
  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
      return Song.find_by_name(name)
      
    else 
      return Song.create_by_name(name)
    end 
  end 
  
  def self.alphabetical
    return @@all.sort_by{|song| song.name}.uniq
  end 
  
  def self.new_from_filename(file_name)
    #Step 1: remove the - from the string and place in a array
    song_file_parts = file_name.split(" - ")
    
    #Step 2: Remove the .mp3 and update the original array
    song_file_parts[1].slice!(".mp3")
    
    #binding.pry
    
    #Step 3: Store the artist and song name in new variables
    artist_name = song_file_parts[0]
    song_name = song_file_parts[1]
    
    #Step 4: Create the new Song and return
    new_song = Song.new
    new_song.name = song_name
    new_song.artist_name = artist_name
    
    return new_song
  end 
  
  def self.create_from_filename(file_name)
    file_parts = file_name.split(" - ")
    
    file_parts[1].slice!(".mp3")
    #binding.pry
    
    artist_name = file_parts[0]
    song_name = file_parts[1]
    
    new_song = Song.create
    new_song.name = song_name
    new_song.artist_name = artist_name
    
    return new_song
  end 
  
  def self.destroy_all
    return self.all.clear
  end 

end
