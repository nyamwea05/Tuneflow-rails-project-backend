class CreatePlaylists < ActiveRecord::Migration[7.0]
  def change
    create_table :playlists do |t|
      t.string :playlist_name
      t.string :descriptions

      t.timestamps
    end
  end
end
