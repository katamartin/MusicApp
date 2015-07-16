class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :band_id
      t.string :album_type
      t.timestamps null: false
    end

    add_index :albums, :title, unique: true
    add_index :albums, :band_id
  end
end
