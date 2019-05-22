require('pry')
require_relative('./models/album.rb')
require_relative('./models/artist.rb')

Album.delete_all()
Artist.delete_all()

artist_1 = Artist.new({'name' => 'Prince'})
artist_2 = Artist.new({'name' => 'John Lennon'})
artist_3 = Artist.new({'name' => 'John Travolta'})

artist_1.save()
artist_2.save()
artist_3.save()

artist_2.name = 'John Legend'
# artist_2.update()
#artist_3.delete()

all_artists = Artist.all()

album_1 = Album.new({
  'artist_id' => artist_1.id,
  'title'=> 'Purple Rain',
  'genre'=> 'Pop'
})
album_1.save()

album_2 = Album.new({
  'artist_id' => artist_2.id,
  'title'=> 'Imagine',
  'genre'=> 'Pop'
})
album_2.save()

album_3 = Album.new({
  'artist_id' => artist_1.id,
  'title'=> 'Sign',
  'genre'=> 'Pop'
})
album_3.save()

album_3.title = 'Velocity'
album_3.update()

album_2.delete()

all_albums = Album.all()

binding.pry
nil

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
