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

  # def name 
  #   @name = name
  # end

  def self.new_by_name(name)
    song = self.new
    song.name = name 
    song
  end

  def self.create_by_name(name)
    song = self.new 
    song.name = name
    song.save 
    song
  end 

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
    # self.each do |song| 
    #   if song.name == name
    #     puts song.name 
    #   else 
    #     return false
    #   end
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      return find_by_name(name)
    else 
      create_by_name(name)
    end
  end

  def self.alphabetical
    #puts "all is #{all}"
    abc_array = []
    all.each do |i| 
      abc_array<< i.name
      puts "i name is #{i.name}"
    end 
    sorted_array = abc_array.sort
    sorted_array.map {|song| find_by_name(song)}

  end

  def self.new_from_filename(filename)
    song = self.new
    artist_song = filename.split(" - ")
    song.artist_name = artist_song[0] 
    song.name = artist_song[1].chomp!(".mp3")
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    artist_song = filename.split(" - ")
    song.artist_name = artist_song[0] 
    song.name = artist_song[1].chomp!(".mp3")
    song.save
    song
  end

  def self.destroy_all
    @@all.clear()
  end

end
