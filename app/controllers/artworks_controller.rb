class ArtworksController < ApplicationController

    def index
        user = User.find_by(id: params[:user_id])
        artworks = user.artworks + user.shared_artworks
        render json: artworks
    end

    def show
        artwork = Artwork.find_by(id: params[:id])

        if artwork
            render json: artwork
        else
            render json: "No artwork found"
        end
    end

    def create
        artwork = Artwork.new(artwork_params)

        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        artwork = Artwork.find_by(id: params[:id])

        if artwork.update_attributes(artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find_by(id: params[:id])
        if artwork
            artwork.destroy
            render json: "Successfully deleted"
        else
            render json: "Artwork not found"
        end
    end

    def like
        like = Like.new(user_id: params[:user_id], likeable_id: params[:id], likeable_type: 'Artwork')
        if like.save
            render json like
        else
            render json: like.errors.full_messages, status: :unprocessable_entity
        end
    end

    def unlike
        like = Like.find_by(user_id: params[:user_id], likeable_id: params[:id], likeable_type: 'Artwork')

        if like
            like.destroy
            render json: "Unliked"
        else
            render json: "Cannot be unliked"
        end
    end

    private
    def artwork_params
        params.require(:artwork).permit(:artist_id, :title, :image_url)
    end
end
