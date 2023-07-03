class Favorite < ApplicationRecord
  belongs_to :song_id
  belongs_to :user_id
end
