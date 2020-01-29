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
    @@all << song
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
    @@all << song
    song 
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) || self.create_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name[0]}
  end

  def self.new_from_filename(filename)
    pattern = /[-.]/
    files = filename.split(pattern)
        artist_name = files[0].strip
        song_name = files[1].strip
        # ext = files[2].strip
        # binding.pry
        song = self.new
        song.name = song_name
        song.artist_name = artist_name
        song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    self.all.clear
  end
end
