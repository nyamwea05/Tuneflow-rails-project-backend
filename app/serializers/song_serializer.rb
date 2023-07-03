class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :genre, :description, :image_path, :release_date
  has_one :artist_id
  has_one :album_id
  has_one :playlist_id
end
