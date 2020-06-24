class Artwork < ApplicationRecord

    validates :title, :image_url, presence: true
    validates :title, uniqueness: {scope: :artist_id}
end
