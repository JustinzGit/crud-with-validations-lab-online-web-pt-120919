class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.invalid?
      render :new
    else
      @song.save
      redirect_to song_path(@song)
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    if @song.invalid?
      render :edit
    else
      redirect_to song_path(@song)
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end 

  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

end