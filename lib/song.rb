class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize

  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name = name}
  end

  def self.find_or_create_by_name(name)
    self.all.detect {|song| song.name =name} ||= Song.new_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}

  end

  def self.new_from_filename(filename)
    data = filename.split(/\s\-\s|\./)
    artist = data[0]
    song_name = data[2]
    new_song = Song.new_by_name(song_name)
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(filename)
    data = filename.split(/\s\-\s|\./)
    artist = data[0]
    song_name = data[2]
    new_song = Song.create_by_name(song_name)
    new_song.artist_name = artist
    new_song
  end

  def self.destroy_all
    self.all.clear
  end


end
