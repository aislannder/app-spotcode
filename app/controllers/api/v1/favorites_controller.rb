class Api::V1::FavoritesController < ApplicationController
    def index
        @favorite_albums  = current_user.favorites.where(favorite_type: "Album").map(&:favoritable)
        @favorite_songs   = current_user.favorites.where(favorite_type: "Song").map(&:favoritable)
        @favorite_artists = current_user.favorites.where(favorite_type: "Artist").map(&:favoritable)
    end
    
    def create
        @favoritable = current_user.favorites.create(favorite_type: params[:favorite_type], favorite_id: params[:id])
        head :ok
    end
    
    def destroy
        @favoritable = current_user.favorites.find_by(favorite_type: params[:favorite_type], favorite_id: params[:id])
        @favoritable.destroy
        head :ok
    end
end
