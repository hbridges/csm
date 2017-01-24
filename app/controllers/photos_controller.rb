class PhotosController < ApplicationController
    before_action :authenticate_admin!, only: [:new, :create, :edit, :destroy, :update]

    def create
        @album = Album.find(params[:album_id])
        @photo = @album.photos.create(photo_params)
        redirect_to album_path(@album)
    end

    private

    def photo_params
        params.require(:photo).permit(:picture, :name)
    end
end
