require "artist_repository"

def reset_artists_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end
describe ArtistRepository do
  before(:each) do
    reset_artists_table
  end

  it "returns all entries from the table" do
    repo = ArtistRepository.new
    artists = repo.all

    expect(artists[0].name).to eq "Pixies"
    expect(artists[0].genre).to eq "Rock"
    expect(artists[1].name).to eq "ABBA"
    expect(artists[1].genre).to eq "Pop"
    expect(artists[2].name).to eq "Taylor Swift"
    expect(artists[2].genre).to eq "Pop"
    expect(artists[3].name).to eq "Nina Simone"
    expect(artists[3].genre).to eq "Pop"
  end
end