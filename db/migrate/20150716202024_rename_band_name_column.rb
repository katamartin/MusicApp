class RenameBandNameColumn < ActiveRecord::Migration
  def change
    remove_column :bands, :title
    add_column :bands, :name, :string
    add_index :bands, :name, unique: true
  end
end
