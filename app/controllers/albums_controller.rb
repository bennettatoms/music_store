class AlbumsController < ApplicationController
  def index
    @albums = Album.all 
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:success] = 'Album successfully created.'
      redirect_to albums_path
    else
      render 'new'
    end
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      flash[:success] = "Album was updated successfully."
      redirect_to album_path(@album.id)
    else
      render 'edit'
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    flash[:success] = "Album deleted."
    redirect_to albums_path
  end

  private
    def album_params
      params.require(:album).permit(:name, :artist, :genre, :price)
    end
end
