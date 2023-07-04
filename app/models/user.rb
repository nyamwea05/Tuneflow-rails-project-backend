class User < ApplicationRecord
    has_many :favorites
    has_many :playlists
    has_many :comments



    validates :first_name, :last_name, :username, :email, presence: true
    validates :username, :phone, :email, uniqueness: true
  
  
    has_secure_password
end
