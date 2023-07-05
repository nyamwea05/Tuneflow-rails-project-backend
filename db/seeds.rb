# Seed data for Users
20.times do
  user = User.create!(
    username: Faker::Internet.username,
    password: 'password',
    image_url: Faker::Avatar.image,
    bio: Faker::Lorem.paragraph,
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    phone: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    avatar: Faker::Avatar.image
  )
end
# Seed data for Albums
10.times do
  Album.create!(
    name: Faker::Music.album,
    album_image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['album']),
    description: Faker::Lorem.sentence,
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  )
end

# Seed data for Artists
10.times do
  Artist.create!(
    name: Faker::Music.band,
    image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['musician']),
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  )
end

# # Seed data for Playlists
# 10.times do
#   Playlist.create!(
#     playlist_name: Faker::Lorem.words(number: 2).join(' '),
#     descriptions: Faker::Lorem.sentence,
#     created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
#     updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
#   )
# end
User.all.each do |user|
  2.times do
    playlist = Playlist.new(
    user_id: user.id,
    playlist_name: Faker::Lorem.words(number: 2).join(' '),
    descriptions: Faker::Lorem.sentence,
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
    )
    playlist.user_id = User.pluck(:id).sample
    playlist.save!
  end
end

# Seed data for Songs
30.times do
  Song.create!(
    title: Faker::Lorem.words(number: 3).join(' '),
    genre: Faker::Music.genre,
    description: Faker::Lorem.sentence,
    image_path: Faker::LoremFlickr.image(size: "300x300", search_terms: ['music']),
    release_date: Faker::Date.between(from: 10.years.ago, to: Date.today),
    artist_id: Artist.pluck(:id).sample,
    album_id: Album.pluck(:id).sample,
    playlist_id: Playlist.pluck(:id).sample,
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  )
end

# Seed data for Favorites (created after User and Song)
User.all.each do |user|
  2.times do
    favorite = Favorite.new(
      user_id: user.id,
      created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
      updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
    )
    favorite.song_id = Song.pluck(:id).sample
    favorite.save!
  end
end





# Seed data for Comments
20.times do
  Comment.create!(
    comment: Faker::Lorem.sentence,
    song_id: Song.pluck(:id).sample,
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    user_id: User.pluck(:id).sample
  )
end
