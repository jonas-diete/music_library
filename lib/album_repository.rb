require './lib/album.rb'

class AlbumRepository
  
  def all
    query = 'SELECT id, title, release_year, artist_id FROM albums;'
    result = DatabaseConnection.exec_params(query, [])
    array = []
    result.each do |hash|
      album = Album.new
      album.id = hash['id']
      album.title = hash['title']
      album.release_year = hash['release_year']
      album.artist_id = hash['artist_id']
      array << album
    end

    return array
    # Executes the SQL query:
    # SELECT id, title, release_year, artist_id FROM albums;
    # Returns an array of album objects.
  end
  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, release_year FROM albums WHERE id = 1;
    # Returns a single album object.
  end
end