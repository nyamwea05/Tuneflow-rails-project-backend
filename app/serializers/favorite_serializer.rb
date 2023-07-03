class FavoriteSerializer < ActiveModel::Serializer
  attributes :id
  has_one :song_id
  has_one :user_id
end
