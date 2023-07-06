class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :name, :album_image_url, :description
  has_many :songs,serializer: SongSerializer, if: :include_songs?
  def include_songs?
    instance_options[:include_songs]
  end
end
