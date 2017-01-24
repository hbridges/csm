class AddPictureToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :picture, :string
  end
end
