class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.string :caption
      t.integer :pet_id

      t.timestamps
    end
    add_index :photos, :pet_id
  end
end
