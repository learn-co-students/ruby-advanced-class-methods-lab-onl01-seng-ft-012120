require "pry"

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
          @@all << song = Song.new
          song
        end

        def self.new_by_name(title)
          song = self.new
          song.name = title
          song
        end

        def self.create_by_name(title)
          @@all << song = self.new
          song.name = title
          song
        end

        def self.find_by_name(title)
          @@all.find {|song| song.name==title }
        end

        def self.find_or_create_by_name(title)
          self.create_by_name(title)
          self.find_by_name(title)
        end

        def self.alphabetical
          @@all.sort_by {|a| a.name}
        end

        def self.new_from_filename(filename)

            song_data = filename.split("-")

             artist = song_data[0].strip

            song_name = song_data[1].split(".").delete_at(0).strip

            song = self.new
            song.name = song_name
            song.artist_name = artist

            song
        end

        def self.create_from_filename(filename)
          song_data = filename.split("-")

           artist = song_data[0].strip

          song_name = song_data[1].split(".").delete_at(0).strip

          @@all << song = self.new
          song.name = song_name
          song.artist_name = artist

          song
        end

        def self.destroy_all
          @@all.clear
        end
end
