require_relative 'lib/database_connection'
require_relative 'lib/album_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

# Perform a SQL query on the database and get the result set.
album_repository = AlbumRepository.new
record = album_repository.find(3)

# Print out the record that was returned
p record.id
p record.title
p record.release_year
p record.artist_id
