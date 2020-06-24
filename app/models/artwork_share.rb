class ArtworkShare < ApplicationRecord

    validates :artwork_id, uniqueness: {scope: :viewer_id}

    belongs_to :artwork
    
    belongs_to :viewer, 
        foreign_key: :viewer_id,
        class_name: :User
end
