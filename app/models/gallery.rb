class Gallery < ApplicationRecord
    has_many :blocks
    belongs_to :user
    has_one_attached :featured_image
end
