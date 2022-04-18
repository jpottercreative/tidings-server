class GallerySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :published, :published_on, :coda, :featured_image_url, :share_url
  has_many :blocks




end
