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
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(var)
    new_song = self.new
    new_song.name = var
    new_song
  end 
  
  def self.create_by_name(title)
    new_song = self.new
    new_song.name = title
    new_song.save
    new_song
  end

  def self.find_by_name(title)
    @@all.find  do |song|
      song.name == title 
    end
  end

  def self.find_or_create_by_name(title)
    
      if self.find_by_name(title)
        self.find_by_name(title)
      else
        self.create_by_name(title)
      end
    
  end

  def self.alphabetical
    @@all.sort_by do |song| 
      song.name
    end
  end



  def self.new_from_filename(file)
   
    new_file = file.split(/ \- |\./)
    new_song = self.new_by_name(new_file[1])
    new_song.artist_name = new_file[0]
    new_song
     
  end

  def self.create_from_filename(file)
  
    new_file = file.split(/ \- |\./)
    new_song = self.new_by_name(new_file[1])
    new_song.artist_name = new_file[0]
    new_song.save
    new_song

  end


  def self.destroy_all
    @@all.clear
  end

end
