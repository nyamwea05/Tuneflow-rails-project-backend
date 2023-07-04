class Album < ApplicationRecord
    has_many :songs
    has_one :artist , through: :songs
end
