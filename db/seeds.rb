# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'faker'
# Generate data for the 'albums' table
10.times do
  Album.create(
    name: Faker::Music.album,
    album_image_url: Faker::Internet.url,
    description: Faker::Lorem.sentence
  )
end
# Generate data for the 'artists' table
10.times do
  Artist.create(
    name: Faker::Music.band,
    image_url: Faker::Internet.url
  )
end
# Generate data for the 'comments' table
30.times do
  Comment.create(
    comment: Faker::Lorem.sentence,
    song_id: rand(1..10), # Assuming there are 10 songs
    user_id: rand(1..10)  # Assuming there are 10 users
  )
end
# Generate data for the 'favorites' table
30.times do
  Favorite.create(
    song_id: rand(1..10), # Assuming there are 10 songs
    user_id: rand(1..10)  # Assuming there are 10 users
  )
end
# Generate data for the 'playlists' table
5.times do
  Playlist.create(
    playlist_name: Faker::Music::RockBand.name,
    descriptions: Faker::Lorem.paragraph
  )
end
# Generate data for the 'songs' table
20.times do
  Song.create(
    title: Faker::Music::GratefulDead.song,
    genre: Faker::Music.genre,
    description: Faker::Lorem.paragraph,
    image_path: Faker::Internet.url,
    release_date: Faker::Date.backward(days: 365),
    artist_id: rand(1..10),     # Assuming there are 10 artists
    album_id: rand(1..10),      # Assuming there are 10 albums
    playlist_id: rand(1..5)     # Assuming there are 5 playlists
  )
end
# Generate data for the 'users' table
10.times do
  User.create(
    username: Faker::Internet.unique.username(specifier: 5..8),
    password_digest: Faker::Internet.password,
    image_url: Faker::Internet.url,
    bio: Faker::Lorem.sentence,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.unique.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    avatar: Faker::Internet.url
  )
end
