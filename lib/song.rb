class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def self.create 
    s = self.new 
    s.save 
    s 
  end 
  
  def self.new_by_name(name)
    s = self.new 
    s.name= name 
    s 
  end 
  
  def self.create_by_name(name)
    s = self.new_by_name(name)
    s.save 
    s
  end 
  
  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end 
  
  def self.find_or_create_by_name(name)
    if !!self.find_by_name(name)
      self.find_by_name(name)
    else 
      create_by_name(name)
    end 
  end 
  
  def self.alphabetical
    self.all.sort { |a, b,| a.name <=> b.name }
  end 
  
  def self.new_from_filename(file)
    data = file.split(/( - |\.)/)
    s = self.new_by_name(data[2])
    s.artist_name= data[0]
    s
  end 

  def self.create_from_filename(file)
    s = self.new_from_filename(file)
    s.save
  end 
  
  def self.destroy_all
    self.all.clear
  end 
  
  def save
    self.class.all << self
  end

end
