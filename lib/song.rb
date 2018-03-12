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
    self.all << Song.new
    self.all[-1]
  end


end
