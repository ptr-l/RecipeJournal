class Recipe < ApplicationRecord
    belongs_to :user 
    has_many_attached :images

    def image_thumbnails 
        images.map do |image| 
            image.variant(resize_to_limit: [250, 250]).processed 
        end 
    end 
end
