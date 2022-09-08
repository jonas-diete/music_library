require_relative "../app"
require "album_repository"
require "artist_repository"

describe Application do
  it "returns all albums when asked to" do
    io = double(:io)
    expect(io).to receive(:puts).with("Welcome to the music library manager!")
    expect(io).to receive(:puts).with("\nWhat would you like to do?")
    expect(io).to receive(:puts).with("1 - List all albums")
    expect(io).to receive(:puts).with("2 - List all artists")
    expect(io).to receive(:print).with("\nEnter your choice: ")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("\nHere is the list of albums")
    expect(io).to receive(:puts).with("1 - Doolittle - 1989")
    expect(io).to receive(:puts).with("2 - Surfer Rosa - 1988")
    expect(io).to receive(:puts).with("3 - Waterloo - 1974")

    app = Application.new(
      'music_library_test',
      io,
      AlbumRepository.new,
      ArtistRepository.new
    )
    app.run
  end

  it "returns all artists when asked to" do
    io = double(:io)
    expect(io).to receive(:puts).with("Welcome to the music library manager!")
    expect(io).to receive(:puts).with("\nWhat would you like to do?")
    expect(io).to receive(:puts).with("1 - List all albums")
    expect(io).to receive(:puts).with("2 - List all artists")
    expect(io).to receive(:print).with("\nEnter your choice: ")
    expect(io).to receive(:gets).and_return("2")
    expect(io).to receive(:puts).with("\nHere is the list of artists")
    expect(io).to receive(:puts).with("1 - Pixies - Rock")
    expect(io).to receive(:puts).with("2 - ABBA - Pop")
    expect(io).to receive(:puts).with("3 - Taylor Swift - Pop")
    expect(io).to receive(:puts).with("4 - Nina Simone - Pop")

    app = Application.new(
      'music_library_test',
      io,
      AlbumRepository.new,
      ArtistRepository.new
    )
    app.run
  end
end