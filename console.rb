require('pry')
require_relative('./models/album.rb')
require_relative('./models/artist.rb')

# Album.delete_all()
# Artist.delete_all()

artist_1 = Artist.new({'name' => 'Prince'})
artist_2 = Artist.new({'name' => 'John Lennon'})
artist_1.save()
artist_2.save()

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

binding.pry
nil
