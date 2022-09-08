require_relative './album.rb'

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
  end

  def find(id)
    query = "SELECT id, title, release_year, artist_id FROM albums WHERE id = $1;"
    result = DatabaseConnection.exec_params(query, [id])
    record = result[0]
    album = Album.new
    album.id = record['id']
    album.title = record['title']
    album.release_year = record['release_year']
    album.artist_id = record['artist_id']
    return album
  end

  def create(album)
    sql = "INSERT INTO albums (title, release_year, artist_id) VALUES ($1, $2, $3);"
    DatabaseConnection.exec_params(sql, [album.title, album.release_year, album.artist_id])
  end

end