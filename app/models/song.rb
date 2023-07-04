class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :album
  belongs_to :playlist
  
  has_many :comments
  has_many :favorites
end
