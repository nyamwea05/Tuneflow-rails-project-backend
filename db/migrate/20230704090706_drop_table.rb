class DropTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :songs
    drop_table :favorites
    drop_table :comments
  end
end
