class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :genre, :description, :image_path, :release_date
end
