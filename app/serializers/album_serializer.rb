class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :name, :album_image_url, :description
end
