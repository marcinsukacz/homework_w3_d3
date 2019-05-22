require_relative('./album.rb')
require_relative('../db/sql_runner.rb')


class Artist

  attr_reader(:id)
  attr_accessor(:name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
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
