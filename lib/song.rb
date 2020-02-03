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
    temp_song = self.new 
    @@all << temp_song
    return temp_song
  end
  
  def self.new_by_name(name)
    temp_song = self.new 
    temp_song.name = name
    return temp_song
  end
  
  def self.create_by_name(name)
    temp_song = self.new 
    temp_song.name = name
    @@all << temp_song
    return temp_song
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
    if find_by_name(name)
      return find_by_name(name)
    else
      return create_by_name(name)
    end
  end
  
  def self.alphabetical 
    return @@all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(file_name)
    names = file_name.split("-")
    name = names[1].split(".")[0].strip
    artist_name = names[0].strip
    
    song = self.create_by_name(name)
    song.artist_name = artist_name
    
    return song
  end
  
  def self.create_from_filename(file_name)
    @@all << new_from_filename(file_name)
  end
  
  def self.destroy_all 
    @@all.clear
  end
end

