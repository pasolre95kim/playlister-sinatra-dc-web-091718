class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  post "/songs" do

    name = params[:Name]
    artist = Artist.find_or_create_by(name: params["Artist Name"])

    @song = Song.create(name: name, artist: artist)
    redirect :"songs/#{@song.slug}"
  end



  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

end
