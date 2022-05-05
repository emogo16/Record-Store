class Album
  attr_reader :id, :name

  @@albums = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
    # @year = year
    # @genre = genre
    # @artist = artist
  end

  def self.all
    @@albums.values()
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def update(name)
    @name = name
  end

  def delete
    @@albums.delete(self.id)
  end


  def songs
    Song.find_by_album(self.id)
  end

  def self.search(str)
    # @@albums.find_all { |album| album[1].name.downcase == str.downcase }
     search_results = []
    al = @@albums.find_all { |album| album[1].name.downcase == str.downcase }
      
    search_results.push(al[1])
    

  end
end

# p @@albums.class