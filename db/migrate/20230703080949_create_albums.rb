class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :album_image_url
      t.string :description

      t.timestamps
    end
  end
end
