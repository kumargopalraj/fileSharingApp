class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :tagline
      t.string :image
      t.integer :user_id
      t.integer :album_id

      t.timestamps
    end
  end
end
