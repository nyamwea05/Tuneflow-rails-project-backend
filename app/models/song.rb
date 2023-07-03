class Song < ApplicationRecord
  belongs_to :artist_id
  belongs_to :album_id
  belongs_to :playlist_id
end
