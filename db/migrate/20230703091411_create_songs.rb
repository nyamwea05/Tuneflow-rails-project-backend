class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :genre
      t.string :description
      t.string :image_path
      t.string :release_date
      t.references :artist, null: false, foreign_key: true
      t.references :album, null: false, foreign_key: true
      t.references :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
