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
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find { |song|
      song.name == name
    }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else  
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song|
      song.name
    }
  end

  def self.new_from_filename(filename)
    song = Song.new
    song_data = filename.chomp(".mp3").split(" - ")
    song.name = song_data[1]
    song.artist_name = song_data[0]
    song
  end

  def self.create_from_filename(filename)
    song = Song.new
    song_data = filename.chomp(".mp3").split(" - ")
    song.name = song_data[1]
    song.artist_name = song_data[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
