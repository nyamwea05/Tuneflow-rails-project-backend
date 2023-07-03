class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment
  has_one :song_id
end
