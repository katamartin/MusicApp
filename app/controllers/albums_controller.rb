class AlbumsController < ApplicationController
  def new
    @album = Album.new
    @bands = Band.all
    render :new
  end

  def create
    @album = Album.new(album_params)
    @bands = Band.all
    if @album.save
      redirect_to album_url(@album)
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    @bands = Band.all
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    @album.update(album_params)
    @bands = Band.all
    if @album.save
      redirect_to album_url(@album)
    else
      render :edit
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def index
    render :index
  end

  def destroy
    @album = Album.find(params[:id])
    if @album
      band = @album.band
      @album.destroy
      redirect_to band_url(band)
    end
  end

  def album_params
    params.require(:album).permit(:title, :album_type, :band_id)
  end
end
