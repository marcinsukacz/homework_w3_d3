require_relative('./artist.rb')
require_relative('../db/sql_runner.rb')



class Album

  attr_reader :id
  attr_accessor :title, :genre

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (artist_id, title, genre) VALUES ($1, $2, $3) RETURNING id"
    values = [@artist_id, @title, @genre]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update()
    sql = "UPDATE albums SET (artist_id, title, genre) = ($1, $2, $3)
    WHERE id = $4"
    values = [@artist_id, @title, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map{|album| Album.new(album)}
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def artist()
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    artist_hash = results[0]
    artist = Artist.new(artist_hash)
    return artist
  end


end


# Music Collection
# You have been asked to create an app that will allow a music collector to manage their collection of CDs/records.
#
# In their console they would like to be able to:
#
# Create and Save Artists
#
# Create and Save Albums
#
# List All Artists/Albums
#
# List all the albums they have by an artist
#
# Show the artist any album belongs to
#
# Every artist should have a name, and each album should have a name/title, genre and artist ID.
#
# Further tasks
# Additionally it would be nice to be able to:
#
# Edit Artists/Albums
# Delete Artists/Albums
# Find Artists/Albums by their ID
# Remember to regularly git commit!
