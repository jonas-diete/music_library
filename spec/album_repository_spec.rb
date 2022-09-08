require "album_repository"

def reset_albums_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end
describe AlbumRepository do
  before(:each) do
    reset_albums_table
  end
  # (your tests will go here).
  
  it "returns all albums" do
    repo = AlbumRepository.new
    albums = repo.all

    expect(albums[0].id).to eq '1'
    expect(albums[0].title).to eq 'Doolittle'
    expect(albums[0].release_year).to eq '1989'
    expect(albums[0].artist_id).to eq '1'

    expect(albums[1].id).to eq '2'
    expect(albums[1].title).to eq 'Surfer Rosa'
    expect(albums[1].release_year).to eq '1988'
    expect(albums[1].artist_id).to eq '1'
  end

  it "returns a single album" do
    repo = AlbumRepository.new
    album = repo.find(2)
    expect(album.id).to eq '2'
    expect(album.title).to eq 'Surfer Rosa'
    expect(album.release_year).to eq '1988'
    expect(album.artist_id).to eq '1'
  end

  it "creates a new album and then returns it when using the find method" do
    repo = AlbumRepository.new
      album = Album.new
      album.title = "A Kind of Magic"
      album.release_year = 1986
      album.artist_id = 2
      repo.create(album)

      album = repo.find(4)
      expect(album.title).to eq "A Kind of Magic"
      expect(album.release_year).to eq '1986'
      expect(album.artist_id).to eq '2'
  end
end

