class BandsController < ApplicationController
  def show
    @band = Band.find(params[:id])
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    @band.update(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      render :edit
    end
  end

  def index
    render :index
  end

  def band_params
    params.require(:band).permit(:name)
  end
end
