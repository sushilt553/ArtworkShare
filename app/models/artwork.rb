class Artwork < ApplicationRecord

    validates :title, :image_url, presence: true
    validates :title, uniqueness: {scope: :artist_id}

    has_many :artwork_shares
    belongs_to :artist, class_name: :User
    has_many :shared_viewers, through: :artwork_shares
end
