class AlbumsController < ApplicationController
    before_action :authenticate_admin!, only: [:new, :create, :edit, :destroy, :update]
    def index
        @albums = Album.all
    end

    def new
        @album = Album.new
    end

    def create
        @album = Album.create(album_params)
        if @album.valid?
            redirect_to albums_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @album = Album.find(params[:id])
        @photo = Photo.new
    end

    def edit
        @album = Album.find(params[:id])
    end

    def update
        @album = Album.find(params[:id])
        @album.update_attributes(album_params)
        if @hoto.valid?
            redirect_to albums_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @album = Album.find(params[:id])
        @album.destroy
        redirect_to albums_path
    end

    private

    def album_params
        params.require(:album).permit(:name, :description, :picture)
    end
end
