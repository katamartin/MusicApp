class TracksController < ApplicationController
  def new
    @track = Track.new
    @albums = Album.all
    render :new
  end

  def create
    @track = Track.new(track_params)
    @albums = Album.all
    if @track.save
      redirect_to track_url(@track)
    else
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    @albums = Album.all
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    @track.update(track_params)
    @albums = Album.all
    if @track.save
      redirect_to track_url(@track)
    else
      render :edit
    end
  end

  def show
    @track = Track.find(params[:id])
  end

  def destroy
    @track = Track.find(params[:id])
    if @track
      album = @track.album
      @track.destroy
      redirect_to album_url(album)
    end
  end

  def track_params
    params.require(:track).permit(:title, :album_id, :track_type, :lyrics)
  end
end
